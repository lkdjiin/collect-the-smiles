class Window < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Collect The Smile!"

    @background_image = Gosu::Image.new("assets/images/background.png")

    @player = Player.new

    @items = []
  end

  def update
    update_items
    update_player
  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @items.each(&:draw)
    @player.draw
  end

  private

  def update_items
    populate_items
    @items.each(&:update)
    @items.reject! {|item| item.y > WindowHeight }
  end

  def populate_items
    return if @items.size >= 15

    type = rand
    if type < 0.035
      @items.push(Smiley.new(:smiley_up))
    elsif type < 0.040
      @items.push(Smiley.new(:smiley_down))
    end
  end

  def update_player
    @player.go_left if Gosu::button_down?(Gosu::KbLeft)
    @player.go_right if Gosu::button_down?(Gosu::KbRight)
    @player.move
  end

end
