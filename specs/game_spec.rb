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

  def test_game_step
    @game.step()
    assert_equal(99, @snake.x_pos)
  end

  def test_move_snake
    @game.move_snake()
    assert_equal(99, @snake.x_pos)
  end

  def test_several_steps_should_move_snake
    @game.step()
    @game.step()
    @game.step()
    assert_equal(97, @snake.x_pos)
  end

  def test_input_handler_deals_with_input_correctly__input_that_will_overlap_current_tail
    @game.set_input(:up)
    @game.move_snake()
    assert_equal(51, @snake.y_pos)
  end

  def test_input_handler_cant_move_right_initially_as_tail_is_in_way_still_moves_left
    @game.set_input(:right)
    @game.move_snake()
    assert_equal(99, @snake.x_pos)
  end

  def test_input_handler_deals_with_down_input
    @game.set_input(:down)
    @game.move_snake()
    assert_equal(49, @snake.y_pos)
  end

  def test_input_handler_deals_with_up_input
    @game.set_input(:up)
    @game.move_snake()
    assert_equal(51, @snake.y_pos)
  end

  def test_sequential_movement_no_new_input
    @game.set_input(:up)
    @game.move_snake()
    @game.move_snake()
    assert_equal(52, @snake.y_pos)
  end

  def test_sequential_movement_with_new_input
    @game.set_input(:up)
    @game.move_snake()
    @game.set_input(:right)
    @game.move_snake()
    assert_equal(51, @snake.y_pos)
    assert_equal(101, @snake.x_pos)
  end

  def test_sequential_movement_with_new_input_invalid_new_input_moves_as_last_input
    @game.set_input(:up)
    @game.move_snake()
    @game.set_input(:down)
    @game.move_snake()
    assert_equal(52, @snake.y_pos)
  end

  def test_check_food_snake_overlap_should_create_new_food_if_snake_at_food_pos()
    snake = Snake.new(50,50)
    food = Food.new(50,50)
    grid = Grid.new(200, 100, snake, food)
    game = Game.new(grid)
    game.check_food_snake_overlap()
    refute_equal(food, grid.food)
  end

  def test_check_food_snake_overlap_should_grow_snake_if_snake_at_food_pos()
    snake = Snake.new(50,50)
    food = Food.new(50,50)
    grid = Grid.new(200, 100, snake, food)
    game = Game.new(grid)
    game.check_food_snake_overlap()
    assert_equal([[50,50], [50,50], [51,50], [52,50], [53,50]], snake.tail)
  end

end
