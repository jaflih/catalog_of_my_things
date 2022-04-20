require './application/game'
require './application/author'
require './application/label'
require './application/genre'

def display_games(games)
  puts 'Database is empty! Add a game.' if games.empty?
  puts
  games.each do |game|
    puts "[Game #{game.id}]
    Publish date: #{game.publish_date},
    Archived: #{game.archived}, Multiplayer: #{game.multiplayer} ,
    Last played at: #{game.last_played_at}"
    puts " Author : #{game.author.first_name}, #{game.author.last_name}" unless game.author.nil?
    puts " Genre : #{game.genre.name}" unless game.genre.nil?
    puts " Label : #{game.label.title}, #{game.label.color}" unless game.label.nil?
  end
  puts
end

def add_author(authors, game)
  return if authors.empty?

  puts 'Select the author '
  authors.each_with_index do |author, index|
    puts "#{index}) FirstName: #{author.first_name}, LastName: #{author.last_name}"
  end
  author_id = gets.chomp.to_i
  authors[author_id].add_item(game)
end

def add_genres(genres, game)
  return if genres.empty?

  puts 'Select the genre '
  genres.each_with_index { |genre, index| puts "#{index}) Name #{genre.name}" }
  genres_id = gets.chomp.to_i
  genres[genres_id].add_item(game)
end

def add_label(labels, game)
  return if labels.empty?

  puts 'Select the genre '
  labels.each_with_index { |label, index| puts "#{index}) Title #{label.title}" }
  label_id = gets.chomp.to_i
  labels[label_id].add_item(game)
end

def inputs
  print 'Enter publish date: '
  publish_date = gets.chomp
  print 'Enter archived: '
  archived = gets.chomp
  print 'Enter multiplayer: '
  multiplayer = gets.chomp
  print 'Enter last_played_at: '
  last_played_at = gets
  [publish_date, archived, multiplayer, last_played_at]
end

def create_new_game(authors, genres, labels)
  puts 'Create a new game'
  publish_date, archived, multiplayer, last_played_at = inputs
  puts
  puts "Game #{publish_date} created successfully."
  puts
  game = Game.new(publish_date, archived, multiplayer, last_played_at)
  add_author(authors, game)
  add_genres(genres, game)
  add_label(labels, game)
  game
end
