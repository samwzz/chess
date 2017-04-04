require_relative 'pieces/piece'
require_relative 'pieces/bishop'
require_relative 'pieces/king'
require_relative 'pieces/knight'
require_relative 'pieces/nullpiece'
require_relative 'pieces/pawn'
require_relative 'pieces/queen'
require_relative 'pieces/rook'
require_relative 'display'

class Board
  attr_reader :board

  def initialize
    @null_piece = NullPiece.instance
    @board = Array.new(8) { Array.new(8, nil) }
    make_starting_grid
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @board[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    raise "No piece at start position" if self[start_pos].is_a?(NullPiece)
    raise "Piece cannot move to end position" unless self[end_pos].is_a?(NullPiece)
    self[start_pos].pos, self[start_pos], self[end_pos],  = end_pos, @null_piece, self[start_pos]
  end

  def in_check?(color)
    king_pos = find_king(color)
    board.each do |row|
      row.each do |piece|
        if piece.color != color && !piece.is_a?(NullPiece)
          if piece.moves.include?(king_pos)
            return true
          end
        end
      end
    end
    false
  end

  def dup
    new_board = Array.new(8) { Array.new(8, nil) }
    @board.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        if piece.is_a?(NullPiece)
          new_board[i][j] = piece
        else
          new_board[i][j] = piece.dup
        end
      end
    end

    new_board
  end

  protected

  def find_king(color)
    board.each do |row|
      row.each do |piece|
        return piece.pos if piece.is_a?(King) && piece.color == color
      end
    end
    nil
  end

  def place_piece(positions, piece)
    positions.each do |pos|
      self[pos] = piece.new
    end
  end

  def make_starting_grid
    pieces = %w(Rook Knight Bishop Queen King Bishop Knight Rook)
    [0, 7].each do |row|
      pieces.each_with_index do |piece, col|
        self[[row, col]] = Object.const_get(piece).new([row, col], self)
      end
    end
    [1, 6].each do |row|
      (0..7).each do |col|
        self[[row, col]] = Pawn.new([row, col], self)
      end
    end
    (2..5).each do |row|
      (0..7).each do |col|
        self[[row, col]] = @null_piece
      end
    end
  end

end
