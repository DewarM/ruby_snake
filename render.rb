require 'gosu'
require_relative 'snake'
require_relative 'food'
require_relative 'grid'
require_relative 'game'


class Render < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Snake"
    @snake = Snake.new(100,50)
    @food = Food.new(50,50)
    @grid = Grid.new(200, 100, @snake, @food)
    @game = Game.new(@grid)
  end

  def update
    @game.step()
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
    Gosu.draw_rect(@snake.x_pos, @snake.y_pos, 10, 10, Gosu::Color.argb(0xff_808080))
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
