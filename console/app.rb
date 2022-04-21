require 'json'
require './application/book'
require './application/author'
require './console/book_manager'
require './application/music_album'
require './application/genre'
require './console/music_album_manager'
require './console/game_manager'
require './console/author_manager'

class App
  attr_accessor :books, :games, :authors
  attr_accessor :music_albums
  def initialize
    @books = []
    @games = []
    @authors = [Author.new('Stephen', 'King')]
    @genres = []
    @labels = []
    @music_albums = []
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

  def add_music_album
    @music_albums << add_music_album
  end

  def save_music_album
    save_music_album_data
  end

  def load_music_album
    return [] unless File.exist?('./data/music_album.json')

    @music_albums = []
    data = File.read('./data/music_album.json')
    return if data == "\n"

    JSON.parse(data).each do |music_album|
      music_album = music_album_instance_creator(music_album['name'], music_album['publish_date'])
      @music_albums << music_album
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
