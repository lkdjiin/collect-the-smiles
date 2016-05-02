class Window < Gosu::Window

  def initialize(width, height)
    super
    self.caption = "Collect The Smile!"

    @background_image = Gosu::Image.new("assets/images/background.png")

    @level = Level.new
    @player = Player.new(CollectorProxy.new(@level))
    @ui = UI.new

    @items = []

    @song_player = SongPlayer.new
    @song_player.play(@level.song)

    @game_over = false
  end

  def update
    reset if new_game?
    next_level if @level.completed?

    return if @game_over

    update_game_over
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

  def new_game?
    @game_over && Button.space?
  end

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
  end

  def update_game_over
    return unless @player.lives <= 0

    @game_over = true
    @song_player.play_game_over
  end

  def game_state
    {
      score: @player.score,
      lives: @player.lives,
      game_over: @game_over,
      level: {
        goal: @level.goal,
        number: @level.number,
        collected: @level.collected,
      },
    }
  end

  def reset
    @items = []
    @player.reset
    @level.reset
    @song_player.play(@level.song)
    @game_over = false
  end

  def next_level
    @items = []
    @level.next
    @song_player.play(@level.song)
  end

end
