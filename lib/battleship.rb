require_relative "board"
require_relative "player"

class Battleship
    def initialize(length)
        @player = Player.new
        @board = Board.new(length)
        @remaining_misses = @board.size / 2
    end

    def board
        @board
    end

    def player
        @player
    end

    def start_game
        @board.place_random_ships
        p @board.num_ships
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            p "you lose"
            return true
        else
            return false
        end
    end

    def win?
        count = @board.num_ships
        if count == 0
            p "you win"
            return true
        else
            return false
        end
    end

    def game_over?
        if self.lose? == true || self.win? == true
            return true
        else
            return false
        end
    end

    def turn
        arr = @player.get_move
        if  @board.attack(arr) != true
            @remaining_misses -= 1
        end
        @board.print
        p @remaining_misses
    end

end
