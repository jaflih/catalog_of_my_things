require 'json'
require './application/book'
require './application/author'
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
    @authors = load_authors
    @genres = [Genre.new('Comedy'), Genre.new('Thriller')]
    @labels = []
    @music_albums = load_music_album(@authors, @labels, @genres)
    @games = load_games(@authors)
  end

  def list_all_books
    display_books(@books)
  end

  def create_book()
    @books << create_book
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
    save_authors(@authors)
    save_games(@games)
    save_music_album(@music_albums)
  end
end
