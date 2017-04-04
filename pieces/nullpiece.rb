require 'singleton'
require_relative 'piece'

class NullPiece < Piece
  include Singleton

  def initialize
    @color = nil
  end

  def to_s
    "_"
  end

end
