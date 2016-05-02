class Level
  attr_reader :collected

  def initialize
    @levels = YAML.load_file('levels.yaml')
    @collected = 0
    @index = 0
    @sound_next_level = Gosu::Sample.new("assets/sound/next-level.wav")
  end

  def song
    level['song']
  end

  def collect
    @collected += 1
  end

  def goal
    level['goal']
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

  def reset
    @collected = 0
    @index = 0
  end

  private

  def level
    @levels[@index]
  end
end
