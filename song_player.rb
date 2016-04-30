class SongPlayer
  def play(file)
    @song.stop if @song
    @song = Gosu::Song.new(file)
    @song.volume = 0.25
    @song.play(true)
  end
end
