class Smiley
  attr_reader :x, :y, :type

  def initialize(type)
    @type = type
    @image = if type == :smiley_up
               Gosu::Image.new("assets/images/smiley-yellow.png")
             elsif type == :smiley_down
               Gosu::Image.new("assets/images/smiley-green.png")
             end

    @velocity = Gosu::random(0.8, 3.3)

    @x = rand * (WindowWidth - @image.width)
    @y = 0
  end

  def update
    @y += @velocity
  end

  def draw  
    @image.draw(@x, @y, ZOrder::Items)
  end

  def x_center_of_mass
    @x + @image.width / 2
  end

  def y_center_of_mass
    @y
  end

end
