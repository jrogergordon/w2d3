require_relative "board"
require_relative "human_player"

class Game

    def initialize(player_1_O, player_2_X)
        @player_1 = HumanPlayer.new(player_1_O)
        @player_2 = HumanPlayer.new(player_2_X)
        @current_player = @player_1
        @board = Board.new
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2 
        else
            @current_player = @player_1
        end
    end

