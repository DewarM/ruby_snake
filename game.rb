class Game

  attr_accessor :cur_input

  def initialize(grid)
    @grid = grid
    @cur_input = :left
    @last_input = :left
  end

  def step()
    snake_handler()
  end

  def snake_handler()
    input_hash = {
      left: [-1,0],
      right: [1,0],
      up: [0,1],
      down: [0,-1]
    }
    move = @grid.snake.move(input_hash[@cur_input])
    if move == nil
      @grid.snake.move(input_hash[@last_input])
    end
  end

end
