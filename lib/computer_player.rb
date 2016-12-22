class ComputerPlayer
  attr_accessor :name, :board, :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    moves = open_moves
    moves.each { |pos| return pos if wins?(pos, mark) }
    moves.each { |pos| return pos if wins?(pos, opponent_mark) }
    return random_move
  end

  private

    def opponent_mark
      opponent_mark = mark == :X ? :O : :X
    end

    def wins?(pos, marker)
      board[pos] = marker
      if board.winner
        board[pos] = nil
        return pos
      else
        board[pos] = nil
      end
      false
    end

    def random_move
      open_moves.sample
    end

    def open_moves
      moves = []
      (0..2).each do |r|
        (0..2).each do |c|
          pos = [r, c]
          moves << pos if board[pos].nil?
        end
      end
      moves
    end

end
