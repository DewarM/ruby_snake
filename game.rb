require_relative("input_handler")
require_relative("collision_detector")


class Game

  attr_reader :detector

  def initialize(grid)
    @grid = grid
    @input_handler = InputHandler.new(@grid.snake)
    @detector = CollisionDetector.new()
    @detector.add(@grid.snake.tail[1..@grid.snake.tail.length])
  end

  def step()
    move_snake()
    check_food_snake_overlap()
    # update_collision_detector()
  end

  def move_snake()
    movement = @input_handler.handle_input()
    @grid.snake.move(movement)
  end

  def set_input(input)
    @input_handler.cur_input = input
  end

  def check_food_snake_overlap()
    if @grid.food_snake_check()
      generate_food()
      @grid.snake.grow()
    end
  end

  def check_snake_snake_overlap()
    head = @grid.snake.head
    if @detector.check(head)
      return true
    else
      return false
    end

  end

  def generate_food()
    x = rand(1...@grid.x_size / 10)
    y = rand(1...@grid.y_size / 10)
    @grid.food = Food.new(x,y)
  end

  def update_collision_detector()
    @detector.clear()
    @detector.add(@grid.snake.tail[1..@grid.snake.tail.length])
  end

end
