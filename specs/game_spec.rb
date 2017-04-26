require('minitest/autorun')
require('minitest/rg')
require_relative('../grid.rb')
require_relative('../snake.rb')
require_relative('../food.rb')
require_relative('../game.rb')

class GameTest < MiniTest::Test
  def setup
    @snake = Snake.new(100,50)
    @food = Food.new(50,50)
    @grid = Grid.new(200, 100, @snake, @food)
    @game = Game.new(@grid)
  end

  def test_game_should_have_last_input
    result = @game.cur_input
    assert_equal("LEFT", result)
  end

  def test_game_step
    @game.step()
    assert_equal(99, @snake.x_pos)
  end

  def test_snake_handler_deals_with_input_correctly
    @game.snake_handler()
    assert_equal(99, @snake.x_pos)
  end

  def test_snake_handler_deals_with_input_correctly__input_that_will_overlap_current_tail
    @game.cur_input = "RIGHT"
    @game.snake_handler()
    assert_equal(99, @snake.x_pos)
  end

end
