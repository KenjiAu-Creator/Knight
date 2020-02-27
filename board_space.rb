module ChessTest
  class BoardSpace
    include Comparable
    attr_accessor :row, :col, :value, :knight_move1

    def initialize(value, row, col)
      @value = value.to_i
      @row = row
      @col = col
    end

   def knight_move1(boardspace)
      @knight_move1 = boardspace
    end 

    def knight_move2(boardspace)
        @knight_move2 = boardspace
    end

    # def knight_move3(boardspace)
    #     @knight_move3 = boardspace
    # end

    # def knight_move4(boardspace)
    #     @knight_move4 = boardspace
    # end

    # def knight_move5(boardspace)
    #     @knight_move5 = boardspace
    # end

    # def knight_move6(boardspace)
    #     @knight_mov6 = boardspace
    # end

    # def knight_move7(boardspace)
    #     @knight_move7 = boardspace
    # end

    # def knight_move8(boardspace)
    #     @knight_move8 = boardspace
    # end
  end

  class Board
    attr_accessor :a1, :a2, :a3, :a4, :a5, :a6, :a7, :a8, :b3, :c2
    def initialize
      @a1 = BoardSpace.new(11, 1, 1)
      @a2 = BoardSpace.new(12, 1, 2)
      @a3 = BoardSpace.new(13, 1, 3)
      @a4 = BoardSpace.new(14, 1, 4)
      @a5 = BoardSpace.new(15, 1, 5)
      @a6 = BoardSpace.new(16, 1, 6)
      @a7 = BoardSpace.new(17, 1, 7)
      @a8 = BoardSpace.new(18, 1, 8)

    #   b1 = BoardSpace.new(2,1)
    #   b2 = BoardSpace.new(2,2)
      @b3 = BoardSpace.new(23,2,3)
    #   b4 = BoardSpace.new(2,4)
    #   b5 = BoardSpace.new(2,5)
    #   b6 = BoardSpace.new(2,6)
    #   b7 = BoardSpace.new(2,7)
    #   b8 = BoardSpace.new(2,8)

    #   c1 = BoardSpace.new(3,1)
      @c2 = BoardSpace.new(32,3,2)
    #   c3 = BoardSpace.new(3,3)
    #   c4 = BoardSpace.new(3,4)
    #   c5 = BoardSpace.new(3,5)
    #   c6 = BoardSpace.new(3,6)
    #   c7 = BoardSpace.new(3,7)
    #   c8 = BoardSpace.new(3,8)

    #   d1 = BoardSpace.new(4,1)
    #   d2 = BoardSpace.new(4,2)
    #   d3 = BoardSpace.new(4,3)
    #   d4 = BoardSpace.new(4,4)
    #   d5 = BoardSpace.new(4,5)
    #   d6 = BoardSpace.new(4,6)
    #   d7 = BoardSpace.new(4,7)
    #   d8 = BoardSpace.new(4,8)
    end 
  end
end

x = ChessTest::Board.new

=begin
Move1
new_row = x.a1.row + 2
new_col = x.a1.col + 1

if (new_row < 9 && new_row > 0) && (new_col < 9 && new col > 0)
  new_space = find_space(new_row, new_col)
  x.a1.knight_move1(new_space)
end

Move2
new_row = x.a1.row + 1
new_col = x.a1.col + 2

if (new_row < 9 && new_row > 0) && (new_col < 9 && new col > 0)
  new_space = find_space(new_row, new_col)
  x.a1.knight_move2(x.c2)

Move 3
=end

puts x.a1.row.inspect
