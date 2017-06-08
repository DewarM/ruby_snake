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

  def move(move_array)
    new_pos = [x_pos() + move_array[0], y_pos + move_array[1]]
    @tail.pop()
    @tail.unshift(new_pos)
  end
end
