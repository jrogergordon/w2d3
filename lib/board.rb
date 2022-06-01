class Board
  def initialize(rows)
    @grid = Array.new(rows) {Array.new(rows) {:N} } 
    @size = rows * rows
  end

  def size
    @size
  end

  def [](arr)
    @grid[arr[0]][arr[1]]
  end

  def []=(pos, val)
    @grid[pos[0]][pos[1]] = val
  end

  def num_ships
    count = 0
    @grid.each do |row_0|
        row_0.each do |column_0|
            if column_0 == :S
                count += 1
            end
        end
    end
    count
  end

  def attack(pos)
    if self.[](pos) == :S
        self.[]=(pos, :H)
        p "you sunk my battleship!"
        return true
    else
        self.[]=(pos, :X)
        return false
    end
  end

  def place_random_ships
    count = 1
    @grid.each_with_index do |row_0, idx_0|
        row_0.each_with_index do |column_0, idx_1|
            if count == 4
                @grid[idx_0][idx_1] = :S
                count = 0
            end
            count += 1
        end
    end
  end

  def hidden_ships_grid
    hidden_grid = Array.new(@grid.length) { Array.new(@grid.length) {:N} }
    hidden_grid.each_with_index do |row_0, idx_0|
        row_0.each_with_index do |column_1, idx_1|
            if  @grid[idx_0][idx_1] == :S ||  @grid[idx_0][idx_1] == :N
            hidden_grid[idx_0][idx_1] = :N
            else
                hidden_grid[idx_0][idx_1] = :X
            end
        end
    end
    hidden_grid
  end

  def self.print_grid(grid)
    grid.each do |ele_0|
        puts ele_0.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
