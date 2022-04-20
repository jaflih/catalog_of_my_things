require './application/book'
require './console/book_manager'

class App
  attr_accessor :books

  def initialize
    @books = []
  end

  def list_all_books
    display_books(@books)
  end

  def create_book()
    @books << create_book
  end
end
