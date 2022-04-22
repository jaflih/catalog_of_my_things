require 'json'
require './application/author'

def display_authors(authors)
  puts
  puts 'Database is empty! Add an author.' if authors.empty?
  authors.each { |author| puts "[Author] Firstname: #{author.first_name}, Lastname: #{author.last_name}" }
  puts
end

def save_authors(authors)
  author = authors.map do |item|
    {
      first_name: item.first_name,
      last_name: item.last_name
    }
  end

  data = JSON.generate(author)
  File.write('data/authors.json', data)
end

def load_authors
  return [] unless File.exist?('data/authors.json')

  authors = []

  data = File.read('data/authors.json')
  JSON.parse(data).each do |item|
    authors << Author.new(item['first_name'], item['last_name'])
  end

  authors
end
