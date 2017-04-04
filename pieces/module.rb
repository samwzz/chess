require 'byebug'

module Slideable

  def moves

  end

  private

  def move_dirs

  end

  def horizontal_dirs

  end

  def diagonal_dirs

  end

  def gor_unblocked_moves_in_dir(dx, dy)

  end

end

module Stepable

  def moves

    current_pos = self.pos
    moves = []
    move_diffs.each do |dx, dy|
      moves << [current_pos[0] + dx, current_pos[1] + dy]
    end
    moves.select { |move| move.all? { |pos| pos.between?(0, 7) } }.select do |move|
      self.board[move].is_a?(NullPiece)
    end
  end

  private

  def move_diffs
    if self.is_a?(King)
      ((-1..1).to_a * 2).combination(2).to_a.uniq - [[0,0]]
    elsif self.is_a?(Knight)
      [-2, 2, -1, 1].permutation(2).to_a.reject { |a, b| a.abs - b.abs == 0 }
    end
  end

end
