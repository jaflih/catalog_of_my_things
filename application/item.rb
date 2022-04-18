require 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archived

  def initialize(genre, author, source, label, publish_date, archived)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    currently_year = DateTime.now.next_month.strftime('%Y').to_i
    publish_year = @publish_date[0..3].to_i
    (currently_year - publish_year) >= 10
  end
end
