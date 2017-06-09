require('minitest/autorun')
require('minitest/rg')
require_relative('../collision_detector')

class CollisionDetectorTest < MiniTest::Test

  def setup
    @detector = CollisionDetector.new()
  end

  def test_detector_holds_collision_positions__starts_empty
    assert_equal(@detector.collision_pos, [])
  end

  def test_detector_can_add_collision_positions
    @detector.add([[0,1]])
    assert_equal(@detector.collision_pos, [[0,1]])
  end

  def test_detector_can_return_if_value_is_present_in_collision_pos
    @detector.add([[0,1]])
    assert_equal(true, @detector.check([0,1]))
  end

  def test_detector_value_return_value_false_if_not_present
    @detector.add([[0,1]])
    assert_equal(false, @detector.check([1,1]))
  end

  def test_detector_clear
    @detector.clear()
    assert_equal(@detector.collision_pos, [])
  end

end
