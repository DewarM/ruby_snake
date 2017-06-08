require('minitest/autorun')
require('minitest/rg')
require_relative('../input_handler.rb')
require_relative('../snake.rb')

class InputHandlerTest < MiniTest::Test
  def setup
    @snake = Snake.new(50,50)
    @input_handler = InputHandler.new(@snake)
  end

  def test_can_set_input()
    @input_handler.cur_input = :up
    result = @input_handler.handle_input()
    assert_equal([0,1], result)
  end

  def test_can_get_default_input()
    result = @input_handler.handle_input()
    assert_equal([-1,0], result)
  end

  def test_can_validate_moves()
    @input_handler.handle_input()
    result = @input_handler.validate_move([-1,0])
    assert_equal([-1,0], result)
  end

  def test_can_validate_moves_not_valid
    @input_handler.handle_input()
    result = @input_handler.validate_move([1,0])
    assert_equal([-1,0], result)
  end
end
