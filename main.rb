require 'gosu'

require_relative 'z_order'
require_relative 'player'
require_relative 'window'

WindowWidth  = 640
WindowHeight = 480

window = Window.new(WindowWidth, WindowHeight)
window.show
