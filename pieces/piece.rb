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

  def to_s
    symbol.to_s
  end

end
