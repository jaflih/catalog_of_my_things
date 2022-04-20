require './application/books'

def display_books(books)
  puts 'Database is empty! Add a book.' if books.empty?
  books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
end

def inputs
  print 'Enter title: '
  title = gets.chomp
  print 'Enter author: '
  author = gets
  [title, author]
end

def create_book()
  puts 'Create a new book'
  title, author = inputs
  puts "Book #{title} created successfully."
  Book.new(title, author)
end
