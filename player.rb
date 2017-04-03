require_relative 'board'
require_relative 'display'

class Player
  attr_reader :board, :display

  def initialize(board, display)
    @board = board
    @display = display
  end

  def play_turn
    while true
      display.render
      display.cursor.get_input
      system("clear")
    end
  end

end
