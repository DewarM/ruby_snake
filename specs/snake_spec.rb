require('minitest/autorun')
require('minitest/rg')
require_relative('../snake.rb')

class SnakeTest < MiniTest::Test
  def setup
    @test_snake = Snake.new(5,5)
  end

  def test_snake_can_get_x_position()
    assert_equal(5,@test_snake.x_pos)
  end

  def test_snake_can_get_y_position()
    assert_equal(5, @test_snake.y_pos)
  end

  def test_snake_should_have_tail()
    test_tail = @test_snake.tail
    assert_equal(4, test_tail.length)
  end

  def test_snake_tail_is_correct()
    test_tail = @test_snake.tail
    assert_equal([[5,5], [6,5], [7,5], [8,5]], test_tail)
  end

  def test_snake_can_move_in_x_direction()
    @test_snake.move([-1,0])
    assert_equal(4, @test_snake.x_pos)
  end

  def test_snake_can_move_in_x_direction__tail_is_correct_minus_1()
    @test_snake.move([-1,0])
    assert_equal([[4,5], [5,5], [6,5], [7,5]], @test_snake.tail)
  end

  def test_snake_can_move_in_x_direction__tail_is_correct()
    @test_snake.move([0,1])
    assert_equal([[5,6], [5,5], [6,5], [7,5]], @test_snake.tail)
  end

  def test_snake_can_move_in_y_direction()
    @test_snake.move([0,1])
    assert_equal(6, @test_snake.y_pos)
  end

  def test_snake_can_move_in_y_direction__tail_is_correct()
    @test_snake.move([0,-1])
    assert_equal([[5,4] ,[5,5], [6,5], [7,5]], @test_snake.tail)
  end

  def test_snake_can_move_in_y_direction__tail_is_correct__positive_1
    @test_snake.move([0,1])
    assert_equal([[5,6] ,[5,5], [6,5], [7,5]], @test_snake.tail)
  end

  def test_snake_can_move_multiple_times_with_correct_tail()
    @test_snake.move([0,1])
    @test_snake.move([0,1])
    assert_equal([[5,7], [5,6] ,[5,5], [6,5]], @test_snake.tail)
  end

end
