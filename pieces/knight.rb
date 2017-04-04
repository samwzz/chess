require_relative 'piece'
require_relative 'module'

class Knight < Piece
include Stepable

  def to_s
    "N"
  end

end
