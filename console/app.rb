require './application/book'
require './application/author'
require './console/book_manager'
require './console/game_manager'
require './console/author_manager'

class App
  attr_accessor :books, :games, :authors

  def initialize
    @books = []
    @games = []
    @authors = [Author.new('Stephen', 'King')]
    @genres = []
    @labels = []
  end

  def list_all_books
    display_books(@books)
  end

  def create_book()
    @books << create_book
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
