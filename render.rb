require 'gosu'
require_relative 'snake'
require_relative 'food'
require_relative 'grid'
require_relative 'game'


class Render < Gosu::Window
  def initialize
    @frames = 0
    snake = Snake.new(10,20)
    food = Food.new(30,30)
    @grid = Grid.new(500, 500, snake, food)
    @game = Game.new(@grid)
    super 500, 500
    self.caption = "Snake"
  end

  def update
    @frames += 1
    if @frames % 5 == 0
      @game.step()
    end
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
      @game.set_input(:left)
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
      @game.set_input(:right)
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_BUTTON_0
      @game.set_input(:down)
    end
    if Gosu.button_down? Gosu::KB_DOWN or Gosu::button_down? Gosu::GP_BUTTON_1
      @game.set_input(:up)
    end

  end

  def draw
    Gosu.draw_rect(@grid.food.x_pos*10, @grid.food.y_pos*10, 10, 10, Gosu::Color.argb(0xff_ff0000))
    @grid.snake.tail.each_with_index do |position, index|
      Gosu.draw_rect(position[0]*10, position[1]*10, 10, 10, Gosu::Color.argb(0xff_808080))
    end
  end

  def button_down(id)
    if id == Gosu::KB_ESCAPE
      close
    else
      super
    end
  end

end

Render.new.show
