require('minitest/autorun')
require('minitest/rg')
require_relative('../grid.rb')
require_relative('../snake.rb')
require_relative('../food.rb')

class GridTest < MiniTest::Test

  def setup
    @snake = Snake.new(100,50)
    @food = Food.new(50,50)
    @test_grid = Grid.new(200, 100, @snake, @food)
  end

  def test_can_create_grid
    refute_nil(@test_grid)
  end

  def test_grid_has_x_size
    assert_equal(200, @test_grid.x_size)
  end

  def test_grid_has_y_size
    assert_equal(100, @test_grid.y_size)
  end

  def test_can_hold_snake
    assert_equal(@snake, @test_grid.snake)
  end

  def test_grid_get_food
    assert_equal(@food, @test_grid.food)
  end

  def test_grid_set_food
    new_food = Food.new(30,20)
    @test_grid.food = new_food
    assert_equal(@test_grid.food, new_food)
  end

  def test_grid_can_detect_when_food_and_snake_head_same_pos
    snake_at_food_pos = Snake.new(50,50)
    grid = Grid.new(100,100, snake_at_food_pos, @food)
    assert(grid.food_snake_check)
  end

  def test_grid_detects_when_food_and_snake_are_not_at_same_pos
    refute(@test_grid.food_snake_check)
  end

end
