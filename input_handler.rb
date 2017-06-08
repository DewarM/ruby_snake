class InputHandler

attr_accessor :cur_input

def initialize(snake)
  @snake = snake
  @cur_input = :left
  @last_input = nil
  @input_hash = {
    left: [-1,0],
    right: [1,0],
    up: [0,1],
    down: [0,-1]
  }
end

def handle_input()
    move_array = @input_hash[@cur_input]
    return validate_move(move_array)
end

def validate_move(move_array)
  new_pos = @snake.x_pos() + move_array[0], @snake.y_pos + move_array[1]

  if @snake.tail.include?(new_pos)
    return @input_hash[@last_input]
  else
    @last_input = @cur_input
    return move_array
  end
end

end
