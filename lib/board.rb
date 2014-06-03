class Board
  @board

  def initialize(n)
    @board = Array.new(n*n, "-")
  end

  def board
    @board
  end

  def place(mark, loc)
    if valid?(loc)
      @board[loc] = mark
      @board
    else
      @board
    end
  end

  def valid?(loc)
    loc.is_a? Integer and loc > -1 and loc < @board.length
  end

end
