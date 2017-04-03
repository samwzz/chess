require 'singleton'
require_relative 'piece'

class NullPiece < Piece
  include Singleton

  def to_s
    "_"
  end

end
