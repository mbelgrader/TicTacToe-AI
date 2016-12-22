require 'colorize'
require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :player1, :player2, :current_player, :board

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    player1.mark = :X
    player2.mark = :O
    @current_player = player1
    @board = Board.new
  end

  def play
    until board.over?
      current_player.display(board)
      play_turn
    end

    if board.winner
      winner = board.winner == :X ? player1 : player2
      puts "\n#{winner.name} wins".green
    else
      puts "\nIt's a tie".green
    end
  end

  def play_turn
    pos = current_player.get_move
    board.place_mark(pos, current_player.mark)
    switch_players!
  end

  def switch_players!
    @current_player = current_player == player1 ? player2 : player1
  end

end



if $PROGRAM_NAME == __FILE__
  puts "\nWelcome to Tic Tac Toe!".green
  puts "Enter the game type: \n PVP \n PVC"
  type = gets.strip.downcase

  if type == 'pvc'
    print "\nEnter your name: "
    name = gets.chomp.strip
    human = HumanPlayer.new(name)
    garry = ComputerPlayer.new('garry')

    new_game = Game.new(human, garry)
    new_game.play

  elsif type == 'pvp'
    puts "\nPlayer 1 name: "
    player1_name = gets.strip
    puts "\nPlayer 2 name: "
    player2_name = gets.strip

    human = HumanPlayer.new(player1_name)
    human2 = HumanPlayer.new(player2_name)
    new_game = Game.new(human, human2)
    new_game.play

  else
    puts "\nInvalid type, try again"
  end
end
