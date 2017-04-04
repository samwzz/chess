require 'byebug'

module Slideable

  def moves
    move_dirs
  end

  private

  def move_dirs
    if self.is_a?(Bishop)
      current_pos = self.pos
      all_pos = []

      diagonal_dirs.each do |dx, dy|
        #debugger
        new_pos = [(current_pos[0] + dx), (current_pos[1] + dy)]
        while grow_unblocked_moves_in_dir(new_pos[0], new_pos[1])
          # debugger
          all_pos << new_pos.dup
          new_pos[0] += dx
          new_pos[1] += dy
        end
        if new_pos.all? { |el| el.between?(0, 7) }
          all_pos << new_pos unless self.board[new_pos].color == self.color
        end
      end
      all_pos
    elsif self.is_a?()
  end

  def available(pos)

  end

  def horizontal_dirs
    dir_change = [[1,0],[-1,0],[0,1],[0,-1]]
  end

  def diagonal_dirs
    dir_change = [[-1,-1],[1,-1],[-1,1],[1,1]]
    return dir_change
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    #debugger
    return false unless [dx, dy].all? {|el| el.between?(0, 7)}
    new_pos = [dx, dy]
    if self.board[new_pos].color.nil?
      true
    elsif self.board[new_pos].color == self.color
      false
    else
      false
    end
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
