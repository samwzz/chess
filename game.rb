require_relative 'board'
require_relative 'display'
require_relative 'player'

class Game
  attr_reader :board, :display, :player

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player = Player.new(@board, @display)
  end

  def play
    @play.play_turn
  end
end
