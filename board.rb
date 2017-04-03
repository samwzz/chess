require_relative 'pieces/piece'
require_relative 'pieces/bishop'
require_relative 'pieces/king'
require_relative 'pieces/knight'
require_relative 'pieces/nullpiece'
require_relative 'pieces/pawn'
require_relative 'pieces/queen'
require_relative 'pieces/rook'

class Board
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

  # protected

  def place_piece(positions, piece)
    positions.each do |pos|
      self[pos] = piece.new
    end
  end

  def make_starting_grid
    # rook_positions = [[0,0], [0,7], [7,0], [7,7]]
    # knight_positions = [[0,1], [0,6], [7,1], [7,6]]
    # bishop_positions = [[0,2], [0,5], [7,3], [7,2]]
    # king_positions = [[0,3], [7,3]]
    # queen_positions = [[0,4], [7,4]]
    # pawn_positions = (0..7).map { |n| [1,n] }
    # pawn_positions += (0..7).map { |n| [6,n] }
    pieces = [Rook.new, Knight.new, Bishop.new, King.new, Queen.new, Bishop.new,
              Knight.new, Rook.new]
    [0, 7].each do |row|
      pieces.each_with_index do |piece, col|
        self[[row, col]] = piece
      end
    end
    [1, 6].each do |row|
      (0..7).each do |col|
        self[[row, col]] = Pawn.new
      end
    end
    (2..5).each do |row|
      (0..7).each do |col|
        self[[row, col]] = @null_piece 
      end
    end
  end

end
