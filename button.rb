module Button

  def self.left?
    Gosu::button_down?(Gosu::KbLeft)
  end

  def self.right?
    Gosu::button_down?(Gosu::KbRight)
  end

end
