class Game

  attr_accessor :cur_input

  def initialize(grid)
    @grid = grid
    @cur_input = nil
    @input_hash = {
      left: [-1,0],
      right: [1,0],
      up: [0,1],
      down: [0,-1]
    }
  end

  def step()
    handle_input()
  end

  def handle_input()
    if @cur_input == nil
      @grid.snake.move(@input_hash[:left])
    else
      @grid.snake.move(@input_hash[@cur_input])
    end
  end

end
