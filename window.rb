class Window < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Collect The Smile!"

    @background_image = Gosu::Image.new("assets/images/background.png")

    @player = Player.new
    @ui = UI.new

    @items = []

    @song = Gosu::Song.new("assets/songs/Around the Bend.ogg")
    @song.volume = 0.25
    @song.play(true)

    @game_over = false
  end

  def update
    return if @game_over

    update_items
    update_player
  end

  def draw
    @background_image.draw(0, 0, ZOrder::Background)
    @items.each(&:draw)
    @player.draw
    @ui.draw(game_state)
  end

  private

  def update_items
    return if @player.just_lost_a_life?

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
    @player.update(@items)
    @game_over = true if @player.lives <= 0
  end

  def game_state
    {
      score: @player.score,
      lives: @player.lives,
      game_over: @game_over,
    }
  end

end
