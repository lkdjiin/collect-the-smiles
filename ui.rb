class UI
  ScoreX = 10
  ScoreY = 10
  ScoreColor = 0xff_ffff00

  LivesX = 10
  LivesXShift = 20
  LivesY = 30

  PressSpaceLow = 210
  PressSpaceHigh = 270

  def initialize
    @font = Gosu::Font.new(20, name: "assets/fonts/VT323/VT323-Regular.ttf")
    @big_font = Gosu::Font.new(60, name: "assets/fonts/VT323/VT323-Regular.ttf")
    @heart = Gosu::Image.new("assets/images/heart.gif")
    @y = 240
    @y_velocity = -0.3
  end

  def draw(game)
    draw_score(game[:score])
    draw_lives(game[:lives])
    draw_game_over if game[:game_over]
  end

  private

  def draw_score(score)
    @font.draw("Score: #{score}", ScoreX, ScoreY, ZOrder::UI, 1.0, 1.0,
               ScoreColor)
  end

  def draw_lives(number)
    number.times do |index|
      @heart.draw(LivesXShift * index + LivesX, LivesY, ZOrder::UI)
    end
  end

  def draw_game_over
    @big_font.draw_rel("Game Over", WindowWidth / 2, WindowHeight / 3,
                       ZOrder::UI, 0.5, 0.5)
    @big_font.draw_rel("Press Space To Start", WindowWidth / 2, y,
                       ZOrder::UI, 0.5, 0.5)
  end

  def y
    @y += y_velocity
  end

  def y_velocity
    if @y < PressSpaceLow || @y > PressSpaceHigh
      @y_velocity = -@y_velocity
    end
    @y_velocity
  end
end
