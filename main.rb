require 'gosu'
require 'yaml'

require_relative 'button'
require_relative 'z_order'
require_relative 'player'
require_relative 'smiley'
require_relative 'ui'
require_relative 'song_player'
require_relative 'collector_proxy'
require_relative 'level'
require_relative 'window'

WindowWidth  = 640
WindowHeight = 480

window = Window.new(WindowWidth, WindowHeight)
window.show
