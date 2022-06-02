class Board
    def initialize
        @board = Array.new(3) { Array.new(3) {"_"}}
    end

    def valid?(pos)
        if @board[pos[0]][pos[1]] != nil
            return true
        end
        false
    end

    def empty?(pos)
        if @board[pos[0]][pos[1]] == "_"
            return true
        end
        false
    end

    def place_mark(pos, mark)
        @board[pos[0]][pos[1]] = mark
    end

    def print
        p @board
    end

    def win_row?(mark)
        @board.each_with_index do |ele_0,idx_0|
            if ele_0[0] == mark && ele_0[1] == mark && ele_0[2] == mark
                return true
            end
        end
        false
    end

    def win_col?(mark)
        @board[0].each_with_index do |ele_1, idx_1|
            if ele_1 == mark && @board[1][idx_1] == mark && @board[2][idx_1] == mark
                return true
            end
        end
    end

    def win_diagonal?(mark)
        if @board[0][0] == mark && @board[1][1] == mark && @board[2][2] == mark || @board[0][0] == mark && @board[1][1] == mark && @board[2][2] == mark
            return true
        end
        false
    end

    def win(mark)
        if win_diagonal?(mark) == true || win_row?(mark) == true || win_col?(mark) == true
            return true
        end
        false
    end

    def empty_positions?
        @board.each do |line|
            line.each do |ele|
                if ele == "_"
                    return true
                end
            end
        end
        false
    end
end

