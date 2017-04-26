class Snake
  attr_accessor :tail
  def initialize(x_pos, y_pos)
    @tail = [
              [x_pos, y_pos],
              [x_pos + 1, y_pos],
              [x_pos + 2, y_pos],
              [x_pos + 3, y_pos]
            ]
  end

  def x_pos()
    return @tail.first()[0]
  end

  def y_pos()
    return @tail.first()[1]
  end

  def move_x(amount)
    new_pos = [x_pos() + amount, y_pos]
    return nil if !validate_move(new_pos)
    @tail.pop()
    @tail.unshift(new_pos)
  end

  def move_y(amount)
    new_pos = [x_pos(), y_pos + amount]
    return nil if !validate_move(new_pos)
    @tail.pop()
    @tail.unshift(new_pos)
  end

  def validate_move(new_pos)
    return !@tail.include?(new_pos)
  end

end
