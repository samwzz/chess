require_relative 'piece'

class Pawn < Piece

  def moves
    forward_steps + side_attacks
  end

protected

  def at_start_row?
    if self.color == :B
      self.pos[0] == 1
    else
      self.pos[0] == 6
    end
  end

  def forward_dir
    if self.color == :B
      1
    else
      -1
    end
  end

  def forward_steps
    steps = []
    pos_dup = self.pos.dup
    pos_dup[0] += forward_dir
    steps << pos_dup.dup
    if at_start_row?
      pos_dup[0] += forward_dir
      steps << pos_dup
    end
    steps
  end

  def side_attacks
    attacks = []
    pos_dup = self.pos.dup
    pos_dup[0] += forward_dir
    [1, -1].each do |side_dir|
      pos_dup[1] += side_dir
      attacks << pos_dup.dup if enemy_space?(pos_dup)
      pos_dup[1] -= side_dir
    end
    attacks
  end

  def enemy_space?(pos)
    return true unless board[pos].color == self.color || board[pos].is_a?(NullPiece)
    false
  end

end
