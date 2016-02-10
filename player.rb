class Player

  Y = 390
  AccelerationFactor = 0.5
  SkidingFactor = 0.96
  DistanceOfCollision = 35

  def initialize
    @x = WindowHeight / 2
    @velocity = 0.0
    @image = Gosu::Image.new("assets/images/player.png")
    @sound_collect = Gosu::Sample.new("assets/sound/collect.wav")
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

  def collect(items)
    items.reject! {|item| collide?(item) ? collision : false }
  end

  private

  def collide?(item)
    distance = Gosu::distance(x_center_of_mass, y_center_of_mass,
                              item.x_center_of_mass, item.y_center_of_mass)
    distance < DistanceOfCollision
  end

  def x_center_of_mass
    @x + @image.width / 2
  end

  def y_center_of_mass
    Y + @image.height / 4
  end

  def collision
    @sound_collect.play(1.0)
    true
  end

end
