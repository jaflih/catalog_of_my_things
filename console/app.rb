require 'json'
require './application/book'
require './application/author'
require './application/label'
require './application/music_album'
require './application/genre'
require './console/music_album_manager'
require './console/genre_manager'
require './console/game_manager'
require './console/author_manager'
require './console/book_manager'

class App
  attr_accessor :books, :games, :authors, :music_albums

  def initialize
    @books = []
    @labels = [Label.new('Gift', 'Green'), Label.new('New', 'Blue')]
    @games = []
    @authors = [Author.new('Stephen', 'King')]
    @genres = [Genre.new('Comedy'), Genre.new('Thriller')]
    @labels = []
    @music_albums = load_music_album(@authors, @labels, @genres)
  end

  def list_all_books
    display_books(@books)
  end

  def add_a_book
    @books << create_book(@labels)
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

    result = book_loader(data)
    @books = result.map { |book| book }
  end

  def list_music_albums
    display_music_albums(@music_albums)
  end

  def list_genres
    display_genre(@genres)
  end

  def add_music_album
    @music_albums << create_new_music_album(@authors, @genres, @labels)
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

  def save
    save_music_album(@music_albums)
  end
end
