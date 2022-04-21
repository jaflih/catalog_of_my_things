require 'json'
require './application/book'
require './console/book_manager'
require './application/label'

class App
  attr_accessor :books

  def initialize
    @books = []
    @labels = [Label.new('Gift', 'New')]
  end

  def list_all_books
    display_books(@books)
  end

  def add_a_book
    @books << create_book
  end

  def list_all_labels
    list_labels(@labels)
  end

  def save_book
    save_book_to_file
  end

  def load_book
    return [] unless File.exist?('./data/book.json')

    @books = []
    data = File.read('./data/book.json')
    return if data == "\n" || data.empty?

    JSON.parse(data).each do |book|
      book = book_instance_creator(book['publisher'], book['cover_state'], book['publish_date'])
      @books << book
    end
  end
end
