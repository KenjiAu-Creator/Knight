The task is to build a function knight_moves that shows the simplest possible way to get from one square to another by outputting all squares the knight will stop on along the way.

The board has 2-dimensional coordinates. Your function would therefore look like:

knight_moves([0,0],[1,2]) == [[0,0],[1,2]]
knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]

1. Put together a script that creates a game board and a knight.
2. Treat all possible moves the knight could make as children in a tree. Don't allow any moves to go off the board.
3. Decide which search algorithm is best to use for this case. Hint: one of them could be a potentially infinite series.
4. Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square. Output what that full poath looks like e.g.:

knight_moves([3,3],[4,3])
You made it in 3 moves! Heres your path:
[3,3]
[4,5]
[2,4]
[4,3]

As the goal is to reach the ending square in the shortest path possible, BFS is the appropriate chosen approach. 

Multiple iterations were considered when creating the desired board. The problem is very easy to solve without using nodes but this goes against the intended purpose of the assignment. 