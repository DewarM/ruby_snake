require_relative("input_handler")

class Game

  attr_accessor :cur_input

  def initialize(grid)
    @grid = grid
    @input_handler = InputHandler.new()
  end

  def step()
    move_snake()
  end

  def move_snake()
    movement = @input_handler.handle_input()
    @grid.snake.move(movement)
  end

  def set_input(input)
    @input_handler.cur_input = input
  end

end
