require './application/author'

def display_authors(authors)
  puts
  puts 'Database is empty! Add an author.' if authors.empty?
  authors.each { |author| puts "[Author] Firstname: #{author.first_name}, Lastname: #{author.last_name}" }
  puts
end
