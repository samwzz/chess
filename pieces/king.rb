require_relative 'piece'
require_relative 'module'
require 'byebug'

class King < Piece
  include Stepable

end
