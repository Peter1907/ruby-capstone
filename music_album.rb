require_relative './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :name

  def initialize(publish_date, on_spotify, archived)
    super(publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end
end