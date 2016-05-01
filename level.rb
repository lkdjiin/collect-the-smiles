class Level
  attr_reader :collected

  def initialize
    @levels = YAML.load_file('levels.yaml')
    @collected = 0
  end

  def song
    @levels.first['song']
  end

  def collect
    @collected += 1
  end
end
