class InputHandler

attr_accessor :cur_input

def initialize()
  @cur_input = nil
  @input_hash = {
    left: [-1,0],
    right: [1,0],
    up: [0,1],
    down: [0,-1]
  }
end

def handle_input()
  if @cur_input == nil
    return @input_hash[:left]
  else
    return @input_hash[@cur_input]
  end
end

end
