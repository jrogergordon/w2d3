class HumanPlayer
    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        print "enter a position with coordinates separated with a space like `4 7, your mark is " + @mark
        gets.chomp.split(" ").map(&:to_i)
    end

end


