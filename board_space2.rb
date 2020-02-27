class BoardSpace
    attr_accessor :row, :col, :value, :knight_move1, :next

    def initialize(value, row, col)
      @value = value.to_i
      @row = row
      @col = col
      @next = nil
    end

    def next_space(space)
      @next = space
    end
end

class Board
  attr_accessor :current_space, :root
  def initialize
    @root = BoardSpace.new("00",0,0)
    create_board
  end

  def create_next_link_board
    @current_space = @root
    for i in 1..8
      for j in 1..8
        new_space = BoardSpace.new("#{i}#{j}",i,j)
        @current_space.next_space(new_space)
        @current_space = new_space
      end
    end
  end
  
  def find(row,col)
    if current_space.row == row && current_space.col == col)
      return current_space
    else 
      current_space = current_space.next
      if current_space.nil?
        return false
      end
    end
  end
end

x = Board.new
puts x.root.next.inspect