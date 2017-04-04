require_relative 'piece'
require_relative 'module'

class Knight < Piece
include Stepable

  def to_s
    @color == :W ? "\u2658" : "\u265E"
  end

end
