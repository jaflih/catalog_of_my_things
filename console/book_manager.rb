require_relative '../application/book'

# Utilities for Book and Labels
def inputs
  print 'Enter publisher name: '
  publisher = gets.chomp
  print 'Enter cover state (good or bad): '
  cover_state = gets.chomp
  print 'Enter publish_date (ie YYYY/MM/DD): '
  publish_date = gets.chomp
  [publisher, cover_state, publish_date]
end

def book_instance_creator(publisher, cover_state, publish_date)
  Book.new(publisher, cover_state, publish_date)
end

def label_instance_to_a_book(title, color, book)
  label = Label.new(title, color)
  add_item_label(label, book)
end

def add_item_label(label, book)
  label.add_item(book)
end

# Main Book and Label Functins
def display_books(books)
  puts 'No book found, add a book.' if books.empty?
  books.each.with_index do |book, index|
    book.move_to_archive
    archived_state = if book.archived
                       'archived'
                     else
                       'Not archived'
                     end
    puts "[#{index}] ID: #{book.id}, Publisher: #{book.publisher}, Year: #{book.publish_date},
    Label_title: #{book.label.title}, Label_title: #{book.label.color}, #{archived_state}"
    puts
  end
end

def list_labels(labels)
  labels.each.with_index do |label, index|
    puts %( #{index}\) Title: #{label.title}, Color: #{label.color})
  end
end

def create_book(labels)
  puts
  publisher, cover_state, publish_date = inputs
  book = book_instance_creator(publisher, cover_state, publish_date)
  puts
  puts 'Select Label by number'
  list_labels(labels)
  option = gets.chomp.to_i
  add_item_label(labels[option], book)
  puts 'Book created successfully.'
  book
end

def save_book_to_file
  books = @books.map do |book|
    { id: book.id, publisher: book.publisher, publish_date: book.publish_date, cover_state: book.cover_state,
      label: { Label_title: book.label.title, Label_color: book.label.color } }
  end

  data = JSON.generate(books)
  File.write('./data/book.json', data)
end

def book_loader(data)
  book_instance = []
  JSON.parse(data).each_with_index do |book, index|
    book_instance << book_instance_creator(book['publisher'], book['cover_state'], book['publish_date'])
    label_instance_to_a_book(book['label']['Label_title'], book['label']['Label_color'], book_instance[index])
  end
  book_instance
end
