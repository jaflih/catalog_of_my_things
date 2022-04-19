require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :publish_date
  attr_reader :items

  def initialize(on_spotify, publish_date)
    super(publish_date, archived)
    @id = Random.rand(1..1000)
    @on_spotify = on_spotify
    @items = []
  end
end
