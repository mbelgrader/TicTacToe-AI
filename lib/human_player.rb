class HumanPlayer
  attr_accessor :name, :mark, :board

  def initialize(name)
    @name = name
  end

  def display(board)
    system('clear')
    @board = board
    board.grid.each do |row|
      puts row.join("  |  ")
      puts '------------'
    end
  end

  def get_move
    # debugger
    puts "Where to mark? (row, col)".green
    move = gets.chomp.split(',').map(&:to_i)
    until valid_move?(move)
      puts "\nPlease make a valid move"
      move = get_move
    end
    move
  end

  def valid_move?(move)
    is_number(move) && valid_pos(move) && board.empty?(move)
  end

  def valid_pos(move)
    return false if move.count != 2
    return false if move.first > 2 || move.first < 0
    return false if move.last > 2 || move.last < 0
    true
  end

  def is_number(move)
    move == [0] ? false : true
  end

end
