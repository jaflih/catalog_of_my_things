require './application/item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, archived, multiplayer, last_played_at)
    super(publish_date, archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    currently_year = DateTime.now.next_month.strftime('%Y').to_i
    last_played_year = @last_played_at[0..3].to_i
    super && (currently_year - last_played_year) >= 2
  end
end
