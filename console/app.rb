require './application/book'

class App
  attr_accessor :books

  def initialize
    @books = []
  end

  def list_all_books
    @displayer.display_books(@books)
  end

  def create_book()
    @books << CreateBook.new.create_book
  end
end
