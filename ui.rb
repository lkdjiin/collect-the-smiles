class UI

  def initialize
    @font = Gosu::Font.new(20, name: "assets/fonts/VT323/VT323-Regular.ttf")
  end

  def draw(score:)
    @font.draw("Score: #{score}", 10, 10, ZOrder::UI, 1.0, 1.0, 0xff_ffff00)
  end

end
