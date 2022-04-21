require_relative './book'
require_relative './item'

# Class Label
class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    puts 'Hello i am in label'
    p item
    items << item
    item.label = self
  end
end
