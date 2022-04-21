require 'json'
require './application/book'
require './application/author'
require './console/book_manager'
require './application/label'
require './console/game_manager'
require './console/author_manager'


class App
  attr_accessor :books, :games, :authors

  def initialize
    @books = []
    @labels = [Label.new('Gift', 'New')]
    @games = []
    @authors = [Author.new('Stephen', 'King')]
    @genres = []
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

  def list_games
    display_games(@games)
  end

  def create_game
    @games << create_new_game(@authors, @genres, @labels)
  end

  def list_authors
    display_authors(@authors)

  end
end
