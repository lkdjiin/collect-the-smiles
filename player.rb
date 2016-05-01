class Player

  Y = 390
  AccelerationFactor = 0.5
  SkidingFactor = 0.96
  DistanceOfCollision = 35
  LifeLostPause = 1500

  attr_reader :score, :lives

  def initialize(collector)
    @x = WindowHeight / 2
    @velocity = 0.0
    @image = Gosu::Image.new("assets/images/player.png")
    @sound_collect = Gosu::Sample.new("assets/sound/collect.wav")
    @sound_life_lost = Gosu::Sample.new("assets/sound/life-lost.wav")
    @score = 0
    @lives = 3

    # It's important to note that this value is necessary for the game
    # to avoid to freeze at startup.
    # −20_000 is an arbitrary value. One can use -9999 or -5000 instead.
    @lost_life_at = -20_000

    @angle = 0.0

    @collector = collector
  end

  def update(items)
    just_lost_a_life? ? update_angle : update_general(items)
  end

  def draw
    if just_lost_a_life?
      @image.draw_rot(x_middle, y_middle, ZOrder::Player, @angle)
    else
      @image.draw(@x, Y, ZOrder::Player)
    end
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
    items.reject! {|item| collide?(item) ? collision(item.type) : false }
  end

  def just_lost_a_life?
    Gosu::milliseconds - @lost_life_at < LifeLostPause
  end

  def reset
    @score = 0
    @lives = 3
    @angle = 0.0
    @velocity = 0.0
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
  alias_method :x_middle, :x_center_of_mass

  def y_center_of_mass
    Y + @image.height / 4
  end

  def y_middle
    Y + @image.height / 2
  end

  def collision(type)
    case type
    when :smiley_up
      @score += 10
      @sound_collect.play(1.0)
      @collector.collect
    when :smiley_down
      @lives -= 1
      @sound_life_lost.play(1.0)
      @lost_life_at = Gosu::milliseconds
    end

    true
  end

  def update_angle
    @angle += 10
  end

  def update_general(items)
    go_left if Button.left?
    go_right if Button.right?
    move
    collect(items)
  end

end
