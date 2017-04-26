class Grid
  attr_reader :x_size, :y_size, :snake
  attr_accessor :food

  def initialize(x_size, y_size, snake, food)
    @food = food
    @snake = snake
    @x_size = x_size
    @y_size = y_size
  end
end
