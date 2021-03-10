class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  attr_reader :size

  def [](position)
    @grid[position[0]][position[1]]
  end

  def []=(position, value)
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    count = 0
    @grid.each do |arr|
        arr.each do |val|
          if val == :S 
            count += 1
          end
        end
    end
    count
  end

  def attack(position)
    if self[position] == :S 
        self[position] = :H
        puts "you sunk my battleship!"
        return true
    end
    self[position] = :X
    false
  end

  def place_random_ships
    num = @size / 4
    while num > 0
        position = [rand(@grid.length), rand(@grid.length)]
        if self[position] == :N 
            self[position] = :S 
            num -= 1
        end
    end
  end

  def hidden_ships_grid
    new_grid = @grid.map do |row|
      new_sub = row.map do |val|
        if val == :S
            :N
        else
            val
        end
      end
      new_sub
    end
    new_grid
  end

  def self.print_grid(grid_arr)
    grid_arr.each do |row|
      puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end

end
