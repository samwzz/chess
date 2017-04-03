require 'colorize'
require_relative 'board'
require_relative 'cursor'
require 'byebug'

class Display
  attr_reader :cursor

  def initialize(board)
    @board = board.board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    @board.each_with_index do |row, i|
      row.each.with_index do |piece, j|
        if @cursor.cursor_pos == [i,j]
          print "#{piece.to_s.colorize(:color => :white, :background => :red)} "
        else
          print "#{piece.to_s} "
        end
      end
      puts "\n"
    end
    nil
  end

end
