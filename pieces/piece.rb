class Piece

  attr_accessor :pos, :board

  def initialize(pos = nil, board = nil)
    @pos = pos
    @board = board
  end

  def symbol
    self.class.to_s[0].to_sym
  end

  def to_s
    symbol.to_s
  end

end
