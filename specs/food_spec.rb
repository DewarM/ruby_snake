require('minitest/autorun')
require('minitest/rg')
require_relative('../food.rb')

class FoodTest < MiniTest::Test
  def setup
    @food_test = Food.new(30,50)
  end

  def test_can_get_x_position
    assert_equal(30, @food_test.x_pos)
  end

  def test_can_get_y_position
    assert_equal(50, @food_test.y_pos)    
  end
end
