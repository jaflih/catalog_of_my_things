require_relative './item'

# Class Book
class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, archived: false)
    super(publish_date, archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    return true if super || cover_state == 'bad'
  end
end
