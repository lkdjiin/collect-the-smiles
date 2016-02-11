class UI
  ScoreX = 10
  ScoreY = 10
  ScoreColor = 0xff_ffff00

  LivesX = 10
  LivesXShift = 20
  LivesY = 30

  def initialize
    @font = Gosu::Font.new(20, name: "assets/fonts/VT323/VT323-Regular.ttf")
    @heart = Gosu::Image.new("assets/images/heart.gif")
  end

  def draw(player)
    draw_score(player.score)
    draw_lives(player.lives)
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
end
