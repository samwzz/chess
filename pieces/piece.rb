class Piece

  attr_accessor :pos, :board, :color

  def initialize(pos = nil, board = nil)
    @pos = pos
    @board = board
    @color = pos[0] == 1 || pos[0] == 0 ? :B : :W
  end

  def symbol
    self.class.to_s[0].to_sym
  end

  def valid_moves
    self.moves.reject { |move| move_into_check?(move) }
  end

  def to_s
    case symbol
    when :K
      @color == :W ? "\u2654" : "\u265A"
    when :Q
      @color == :W ? "\u2655" : "\u265B"
    when :R
      @color == :W ? "\u2656" : "\u265C"
    when :B
      @color == :W ? "\u2657" : "\u265D"
    when :P
      @color == :W ? "\u2659" : "\u265F"
    end
  end

private

  def move_into_check?(to_pos)
    dup_board = @board.dup
    color = self.color
    dup_board.move_piece(@pos, to_pos)
    dup_board.in_check?(color)
  end

end
