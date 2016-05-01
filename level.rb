class Level

  def initialize
    @levels = YAML.load_file('levels.yaml')
  end

  def song
    @levels.first['song']
  end
end
