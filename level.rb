class Level
  attr_reader :collected

  def initialize
    @levels = YAML.load_file('levels.yaml')
    @sound_next_level = Gosu::Sample.new("assets/sound/next-level.wav")
    reset
  end

  def reset
    @collected = 0
    @index = 0
  end

  def song
    current 'song'
  end

  def collect
    @collected += 1
  end

  def goal
    current 'goal'
  end

  def number
    @index + 1
  end

  def completed?
    @collected == goal
  end

  def next
    @index += 1
    @index %= @levels.size
    @collected = 0
    @sound_next_level.play
  end

  private

  def current(property)
    @levels[@index][property]
  end
end
