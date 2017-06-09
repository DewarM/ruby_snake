class CollisionDetector

  attr_reader :collision_pos

  def initialize()
    @collision_pos = []
  end

  def add(pos)
    @collision_pos.push(pos)
  end

  def check(pos)
    return @collision_pos.include?(pos)
  end
end
