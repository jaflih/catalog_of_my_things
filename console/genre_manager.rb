require './application/genre'

def display_genre(genres)
  puts
  puts 'Database is empty! Add a genre.' if genres.empty?
  genres.each { |genre| puts "[Genre] Name: #{genre.name}" }
  puts
end
