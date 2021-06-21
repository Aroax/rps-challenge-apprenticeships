require_relative 'computer'
require_relative 'player'

class Game
  attr_reader :player_1, :player_2

  def initialize(player_1, player_2=Computer.new)
    @player_1 = player_1
    @player_2 = player_2
  end

  def return_winner
    if draw?
      return "It's a tie!"
    elsif player1_wins?
      @player_1.win!
      return "#{@player_1.name} wins!"
    else
      @player_2.win!
      return "#{@player_2.name} wins!"
    end
  end

  private

  def player1_wins?
    (@player_1.choice == "scissors" && @player_2.choice == "paper") ||
    (@player_1.choice == "paper" && @player_2.choice == "rock") ||
    (@player_1.choice == "rock" && @player_2.choice == "lizard") ||
    (@player_1.choice == "lizard" && @player_2.choice == "spock") ||
    (@player_1.choice == "spock" && @player_2.choice == "scissors") ||
    (@player_1.choice == "scissors" && @player_2.choice == "lizard") ||
    (@player_1.choice == "lizard" && @player_2.choice == "paper") ||
    (@player_1.choice == "paper" && @player_2.choice == "spock") ||
    (@player_1.choice == "spock" && @player_2.choice == "rock") ||
    (@player_1.choice == "rock" && @player_2.choice == "scissors")
  end

  def draw?
    (@player_1.choice == @player_2.choice) ||
    # Evaluating invalid move entry edge cases as ties for zero score
    ( !["rock", "paper", "scissors", "lizard", "spock"].include?(@player_2.choice) ) ||
    ( !["rock", "paper", "scissors", "lizard", "spock"].include?(@player_1.choice) )
  end
end
