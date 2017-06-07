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
    assert_nil(result)
  end

  def test_game_step
    @game.step()
    assert_equal(99, @snake.x_pos)
  end

  def test_input_handler_deals_with_input_correctly
    @game.handle_input()
    assert_equal(99, @snake.x_pos)
  end

  def test_input_handler_deals_with_input_correctly__input_that_will_overlap_current_tail
    @game.cur_input = :left
    @game.handle_input()
    assert_equal(99, @snake.x_pos)
  end

  def test_input_handler_cant_move_right_initially_as_tail_is_in_way
    @game.cur_input = :right
    @game.handle_input()
    assert_equal(100, @snake.x_pos)
  end

  def test_input_handler_deals_with_down_input
    @game.cur_input = :down
    @game.handle_input()
    assert_equal(49, @snake.y_pos)
  end

  def test_input_handler_deals_with_up_input
    @game.cur_input = :up
    @game.handle_input()
    assert_equal(51, @snake.y_pos)
  end

  def test_sequential_movement_no_new_input
    @game.cur_input = :up
    @game.handle_input()
    @game.handle_input()
    assert_equal(52, @snake.y_pos)
  end

  def test_sequential_movement_with_new_input
    @game.cur_input = :up
    @game.handle_input()
    @game.cur_input = :right
    @game.handle_input()
    assert_equal(51, @snake.y_pos)
    assert_equal(101, @snake.x_pos)
  end

end
