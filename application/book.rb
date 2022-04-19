require_relative './item'
# Class Book
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, archived)
    super(publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end
end
