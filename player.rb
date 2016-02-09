class Player

  def initialize(x, y)
    @x = x
    @y = y
    @image = Gosu::Image.new("assets/images/player.png")
  end

  def draw
    @image.draw(@x, @y, ZOrder::Player)
  end

end
