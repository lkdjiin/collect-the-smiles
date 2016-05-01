class CollectorProxy

  def initialize(level)
    @level = level
  end

  def collect
    @level.collect
  end
end
