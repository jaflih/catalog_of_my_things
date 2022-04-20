require_relative '../application/book'

def display_books(books)
  puts 'No book found, add a book.' if books.empty?
  books.each do |book|
    book.move_to_archive
    archived_state = if book.archived
                       'archived'
                     else
                       'Not archived'
                     end
    puts "[Book] id: #{book.id}, Publisher: #{book.publisher}, Year: #{book.publish_date}, #{archived_state} "
  end
end

def inputs
  print 'Enter publisher name: '
  publisher = gets.chomp
  print 'Enter cover state (good or bad): '
  cover_state = gets.chomp
  print 'Enter publish_date (ie YYYY/MM/DD): '
  publish_date = gets.chomp
  [publisher, cover_state, publish_date]
end

def create_book()
  puts
  publisher, cover_state, publish_date = inputs
  book = book_instance_creator(publisher, cover_state, publish_date)
  puts 'Book created successfully.'
  book
end

def book_instance_creator(publisher, cover_state, publish_date)
  Book.new(publisher, cover_state, publish_date)
end

def save_book_to_file
  books = @books.map do |book|
    { id: book.id, publisher: book.publisher, publish_date: book.publish_date, cover_state: book.cover_state }
  end

  data = JSON.generate(books)
  File.write('./data/book.json', data)
end
