class Player

  Y = 390
  AccelerationFactor = 0.5
  SkidingFactor = 0.96

  def initialize
    @x = WindowHeight / 2
    @velocity = 0.0
    @image = Gosu::Image.new("assets/images/player.png")
  end

  def draw
    @image.draw(@x, Y, ZOrder::Player)
  end

  def go_left
    @velocity -= AccelerationFactor
  end

  def go_right
    @velocity += AccelerationFactor
  end

  def move
    @x += @velocity
    @x %= WindowWidth
    @velocity *= SkidingFactor
  end

end
