class Piece
  def initialize

  end

  def symbol
    self.class.to_s[0].to_sym
  end

  def to_s
    symbol.to_s
  end
end
