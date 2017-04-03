require_relative 'pieces/nullpiece.rb'
require_relative 'pieces/piece.rb'

class Board
  def initialize
    @null_piece = NullPiece.new
    @board = Array.new(8) { Array.new(8, @null_piece) }
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @board[row][col] = val
  end
end
