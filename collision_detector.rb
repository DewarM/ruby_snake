class CollisionDetector

  attr_reader :collision_pos

  def initialize()
    @collision_pos = []
  end

  def add(pos)
    pos.each { |pos_e| @collision_pos.push(pos_e) }
  end

  def check(pos)
    return @collision_pos.include?(pos)
  end

  def clear()
    @collision_pos = []
  end
end
