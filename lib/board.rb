class Board
  attr_reader :board

  def initialize(n)
    @board = Array.new(n*n, "-")
  end

  def place(mark, loc)
    if valid?(loc)
      @board[loc] = mark
    end
    @board
  end

  def valid?(loc)
    loc.is_a? Integer and @board[loc] == "-" and loc > -1 and loc < @board.length
  end

end
