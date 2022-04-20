require './application/game'

def display_games(games)
  puts 'Database is empty! Add a game.' if games.empty?
  puts
  games.each do |game|
    puts "[Game #{game.id}]
    Publish date: #{game.publish_date},
    Archived: #{game.archived}, Multiplayer: #{game.multiplayer} ,
    Last played at: #{game.last_played_at}"
  end
  puts
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

def create_new_game()
  puts 'Create a new game'
  publish_date, archived, multiplayer, last_played_at = inputs
  puts
  puts "Game #{publish_date} created successfully."
  puts
  Game.new(publish_date, archived, multiplayer, last_played_at)
end
