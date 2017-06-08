require_relative("input_handler")

class Game

  def initialize(grid)
    @grid = grid
    @input_handler = InputHandler.new(@grid.snake)
  end

  def step()
    move_snake()
    check_food_snake_overlap()
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
    end
  end

  def generate_food()
    x = rand(1..@grid.x_size / 10)
    y = rand(1..@grid.y_size / 10)
    @grid.food = Food.new(x,y)

  end

end
