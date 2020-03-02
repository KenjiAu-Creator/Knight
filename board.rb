module ChessKnight
  class BoardSpace
    require 'json'
    attr_accessor :row,:col,:value,:next,:knight_move1,:knight_move2,:knight_move3,:knight_move4,:knight_move5,:knight_move6,:knight_move7,:knight_move8

    def initialize(value, row, col)
        @value = value.to_i
        @row = row
        @col = col
        @next = nil
    end

    def next_space(space)
        @next = space
    end

    def knight_move(board_space)
      # This move is +2 up +1 right
      if ((board_space.row - @row) == 2 && (board_space.col - @col) == 1) 
        @knight_move1 = board_space
      end

      # This move is +1 up +2 right
      if ((board_space.row - @row) == 1 && (board_space.col - @col) == 2) 
        @knight_move2 = board_space
      end

      # This move is -2 down -1 left
      if ((@row - board_space.row) == 2 && (@col - board_space.col) == 1)
        @knight_move3 = board_space
      end

      # This move is -1 down -2 left
      if ((@row - board_space.row) == 1 && (@col - board_space.col) == 2)
        @knight_move4 = board_space
      end

      # This move is +2 up -1 left
      if ((board_space.row - @row) == 2 && (@col - board_space.col) == 1)
        @knight_move5 = board_space
      end

      # This move is +1 up -2 left
      if ((board_space.row - @row) == 1 && (@col - board_space.col) == 2)
        @knight_move6 = board_space
      end

      # This move is -2 down + 1 right
      if ((@row - board_space.row) == 2 && (board_space.col - @col) == 1)
        @knight_move7 = board_space
      end

      # This move is -1 down + 2 right
      if ((@row - board_space.row) == 1 && (board_space.col - @col) == 2)
        @knight_move8 = board_space
      end
    end

    def to_json(*args)
      if @parent.nil?
        parent = nil
      else
        parent = @parent
      end

      if @value.nil?
        value = nil
      else
        value = @value
      end

      if @next.nil?
        right = nil
      else
        right = @next.value
      end

      if @knight_move1.nil?
        move1 = nil
      else
        move1 = @knight_move1.value
      end

      if @knight_move2.nil?
        move2 = nil
      else
        move2 = @knight_move2.value
      end

      if @knight_move3.nil?
        move3 = nil
      else
        move3 = @knight_move3.value
      end

      if @knight_move4.nil?
        move4 = nil
      else
        move4 = @knight_move4.value
      end

      if @knight_move5.nil?
        move5 = nil
      else
        move5 = @knight_move5.value
      end

      if @knight_move6.nil?
        move6 = nil
      else
        move6 = @knight_move6.value
      end

      if @knight_move7.nil?
        move7 = nil
      else
        move7 = @knight_move7.value
      end

      if @knight_move8.nil?
        move8 = nil
      else
        move8 = @knight_move8.value
      end

      { 'Starting Space' => value,
        'knight moves' => [move1, move2, move3, move4, move5, move6, move7, move8],
      }.to_json(*args)
    end
  end

  class Board
    attr_accessor :current_space, :root, :knight1
    def initialize
      @root = BoardSpace.new("00",0,0)
      create_next_link_board
      @knight1 = Knight.new(@root)
      
    end

    def create_next_link_board
      # Basic link between one space and the next initially
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
      @current_space = @root
      while !@current_space.nil?
        if (@current_space.row == row && @current_space.col == col)
          return current_space
        else 
          @current_space = @current_space.next
          if @current_space.nil?
            return false
          end
        end
      end
    end

  end

  class Knight < Board
    def initialize(root)
      @root = root
      possible_knight_moves
    end

    def move(input_array, output_array)
      start_space = self.find(input_array[0],input_array[1])
      end_space = self.find(output_array[0],output_array[1])
      queue = []
      current = start_space
      move_count = 0
      path = []

      while !(current.knight_move1.nil?)
        queue.push(current)
        current = current.knight_move1
      end

      while !queue.empty?
        current = queue[]

        if current == end_space
          queue.push(current)
          return queue
        end

        if !current.knight_move2.nil?
          if current.knight_move2 == end_space
            queue.push(current.knight_move2)
            return queue
          end
        end

        if !current.knight_move3.nil?
          if current.knight_move3 == end_space
            queue.push(current.knight_move3)
            return queue
          end
        end

        if !current.knight_move4.nil?
          if current.knight_move4 == end_space
            queue.push(current.knight_move4)
            return queue
          end
        end

        if !current.knight_move5.nil?
          if current.knight_move5 == end_space
            queue.push(current.knight_move5)
            return queue
          end
        end

        if !current.knight_move6.nil?
          if current.knight_move6 == end_space
            queue.push(current.knight_move6)
            return queue
          end
        end

        if !current.knight_move7.nil?
          if current.knight_move7 == end_space
            queue.push(current.knight_move7)
            return queue
          end
        end

        if !current.knight_move8.nil?
          if current.knight_move8 == end_space
            queue.push(current.knight_move8)
            return queue
          end
        end

        remove = queue.pop  
      end

    end

    def possible_knight_moves
      current = @root.next
      possible_knight_space = current.next
      while !(current.nil?)

        current.knight_move(possible_knight_space)
        possible_knight_space = possible_knight_space.next
        
        if possible_knight_space.nil?
          current = current.next
          possible_knight_space = @root.next
        end
      end
    end
  end
end

ExampleBoard = ChessKnight::Board.new
puts ExampleBoard.knight1.move([1,2],[6,6]).to_json

