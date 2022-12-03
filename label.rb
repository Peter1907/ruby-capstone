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
    @items << item unless @items.include?(item)
    item.add_label(self)
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end
