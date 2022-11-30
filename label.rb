require_relative './item'
class Label < Item
  attr_accessor :items, :name, :id

  def initialize(name, id = Random.rand(1..1000))
    super(id)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
