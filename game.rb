class Game

  attr_accessor :cur_input

  def initialize(grid)
    @grid = grid
    @cur_input = "LEFT"
    @last_input = "LEFT"
  end

  def step()
    snake_handler()
  end

  def snake_handler()
    case @cur_input
    when "LEFT"
      move = @grid.snake.move([-1,0])
      if move == nil
        @cur_input = @last_input
        snake_handler()
      end
    when "RIGHT"
      move = @grid.snake.move([1,0])
      if move == nil
        @cur_input = @last_input
        snake_handler()
      end
    end

  end

end
