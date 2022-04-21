require './application/game'
require './application/author'
require './application/label'
require './application/genre'
require './console/helper'

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

def inputs_game
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
  publish_date, archived, multiplayer, last_played_at = inputs_game
  puts
  puts "Game #{publish_date} created successfully."
  puts
  game = Game.new(publish_date, archived, multiplayer, last_played_at)
  add_author(authors, game)
  add_genres(genres, game)
  add_label(labels, game)
  game
end

def save_games(games)
  game = games.map do |item|
    {
      publish_date: item.publish_date,
      archived: item.archived,
      multiplayer: item.multiplayer,
      last_played_at: item.last_played_at,
      author: item.author&.first_name,
      genre: item.genre&.name,
      label: item.label&.title
    }
  end

  data = JSON.generate(game)
  File.write('data/games.json', data)
end

def load_games(authors, labels, genres)
  return [] unless File.exist?('data/games.json')

  games = []

  data = File.read('data/games.json')
  JSON.parse(data).each do |item|
    game = Game.new(item['publish_date'], item['archived'], item['multiplayer'], item['last_played_at'])
    unless item['publish_date'].nil?
      author = seach_author(authors, item['author'])
      author&.add_item(game)
      label = seach_label(labels, item['label'])
      label&.add_item(game)
      genre = seach_genre(genres, item['genre'])
      genre&.add_item(game)
    end
    games << game
  end

  games
end
