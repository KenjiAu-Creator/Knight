module ChessBoard
  class Board
    attr_accessor :space, :a, :b, :c, :d, :e, :f, :g, :sampleKnight

    def initialize
      create_board
      @sampleKnight = Knight.new(1,1)
    end

    def create_board
      # Initialize
      @a = []
      @b = []
      @c = []
      @d = []
      @e = []
      @f = []
      @g = []

      for i in 1..8
        @a.push(BoardSpace.new("a", i))
        @b.push(BoardSpace.new("b", i))
        @c.push(BoardSpace.new("c", i))
        @d.push(BoardSpace.new("d", i))
        @e.push(BoardSpace.new("e", i))
        @f.push(BoardSpace.new("f", i))
        @g.push(BoardSpace.new("g", i))
      end
    end

  end
  
  class BoardSpace
    # attr_accessor :row, :col
    def initialize(row, col)
      @row = row
      @col = col
    end
  end


  class Knight
    def initialize(row, col)
      # Initialize starting position
      @row = row
      @col = col
    end
    
    def move(new_row,new_col)
      if is_valid_move?(new_row, new_col)
        @row = new_row
        @col = new_col
      else
        puts "Invalid move!"
      end
    end

    def is_valid_move?(new_row, new_col)
      if (new_row < 1 || new_col < 1)
        return false
      elsif new_row > 8 || new_col > 8)
        return false
      end
      
      if ((@row - new_row).abs == 1 && (@col - new_col).abs == 2)
        return true
      elsif ((@row - new_row).abs == 2 && (@col - new_col).abs == 1)
        return true
      end
    end
    
    def possible_move(start)
      
    end
  end

end

x = ChessBoard::Board.new
x.sampleKnight.move(2,3)
puts x.sampleKnight.inspect
