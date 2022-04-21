require 'json'
require './application/book'
require './console/book_manager'
require './application/music_album'
require './application/genre'
require './console/music_album_manager'

class App
  attr_accessor :books, :music_albums

  def initialize
    @books = []
    @music_albums = []
    @genres = []

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
  end
end
