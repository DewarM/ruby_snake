require('minitest/autorun')
require('minitest/rg')
require_relative('../input_handler.rb')

class InputHandlerTest < MiniTest::Test
  def setup
    @input_handler = InputHandler.new()
  end

  def test_can_set_input()
    @input_handler.cur_input = :right
    result = @input_handler.handle_input()
    assert_equal([1,0], result)
  end

  def test_can_get_default_input()
    result = @input_handler.handle_input()
    assert_equal([-1,0], result)
  end
end
