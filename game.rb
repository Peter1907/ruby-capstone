require './item'

class Game < Item
  attr_accessor :multiplayer, :last_played

  def initialize(publish_date, multiplayer, last_played, archived: false)
    super(publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played = last_played
  end

  def can_be_archived?
    return true if @publish_date < (Time.now.year - 10).to_s && @last_played < (Time.now.year - 2).to_s

    false
  end

  private :can_be_archived?
end
