require './application/music_album'
require './application/author'
require './application/label'
require './application/genre'

def display_music_albums(music_albums)
  puts 'Database is empty! Add a music album.' if music_albums.empty?
  puts
  music_albums.each do |music_album|
    puts " [Music album id: #{music_album.id}]"
    puts " Publish date: #{music_album.publish_date}"
    puts " Archived: #{music_album.archived}"
    puts " On spotify: #{music_album.on_spotify}"
    puts " Author : #{music_album.author.first_name}, #{music_album.author.last_name}" unless music_album.author.nil?
    puts " Genre : #{music_album.genre.name}" unless music_album.genre.nil?
    puts " Label : #{music_album.label.title}, #{music_album.label.color}" unless music_album.label.nil?
    puts
  end
  puts
end

def input_music_album
  print 'Enter publish date (ie YYYY/MM/DD): '
  publish_date = gets.chomp
  print 'Enter archived (ie Yes/No): '
  archived = gets.chomp
  print 'Enter on spotify/ not on spotify (ie Yes/No): '
  on_spotify = gets
  [publish_date, archived, on_spotify]
end

def create_new_music_album(authors, genres, labels)
  puts 'Create a new music album'
  publish_date, archived, on_spotify = input_music_album
  puts
  music_album = MusicAlbum.new(on_spotify, publish_date, archived)
  add_author(authors, music_album)
  add_genres(genres, music_album)
  add_label(labels, music_album)
  puts
  puts "Music_album #{publish_date} created successfully."
  music_album
end

def save_music_album(music_albums)
  music_album = music_albums.map do |item|
    {
      publish_date: item.publish_date,
      archived: item.archived,
      on_spotify: item.on_spotify,
      author: item.author&.first_name,
      genre: item.genre&.name,
      label: item.label&.title
    }
  end

  data = JSON.generate(music_album)
  File.write('data/music_album.json', data)
end

def load_music_album(authors, labels, genres)
  return [] unless File.exist?('data/music_album.json')

  music_albums = []

  data = File.read('data/music_album.json')
  JSON.parse(data).each do |item|
    music_album = MusicAlbum.new(item['on_spotify'], item['publish_date'], item['archived'])
    unless item['publish_date'].nil?
      author = seach_author(authors, item['author'])
      author&.add_item(music_album)
      label = seach_label(labels, item['label'])
      label&.add_item(music_album)
      genre = seach_genre(genres, item['genre'])
      genre&.add_item(music_album)
    end
    music_albums << music_album
  end

  music_albums
end
