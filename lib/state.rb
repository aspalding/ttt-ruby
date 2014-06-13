class State
  def empty_indices(board)
    indices = []
    for i in 0..board.length - 1
      indices.push(i) if board[i] == "-"
    end
    indices
  end

  def full?(board)
    empty_indices(board) == []
  end

  def tie?(board)
    full?(board) and not winner?(board, "x") and not winner?(board, "o") 
  end

  def other_mark(mark)
    if mark == "x"
      "o"
    else
      "x"
    end
  end

  def horizontal?(board, mark)
    count = 0
      # (0..board.size - 10).each do |column|
      # end POSSIBLE REFACTOR?
    for pos in 0..board.size - 1
      count = 0 if pos % Math.sqrt(board.size) == 0
      if board[pos] == mark
        count += 1
        return true if count == Math.sqrt(board.size)
      end
    end
    return false
  end

  def vertical?(board, mark)
    for col in 0..Math.sqrt(board.size) - 1
      count = 0
      for row in 0..board.size - 1
        count += 1 if (row % Math.sqrt(board.size)) == 0 and board[col+row] == mark
      end
      return true if count == Math.sqrt(board.size)  
    end
    return false
  end

  def diagonal_major?(board, mark)
    count = 0
    for i in 0..board.size - 1
      count += 1 if (i % (Math.sqrt(board.size) + 1)) == 0 and board[i] == mark
      return true if count == Math.sqrt(board.size)
    end
    return false
  end

  def diagonal_minor?(board, mark)
    count = 0
    for i in Integer(Math.sqrt(board.size) - 1)..board.size - 1
      count += 1 if (i % (Math.sqrt(board.size) - 1)) == 0 and board[i] == mark
      return true if count == Math.sqrt(board.size)
    end
    return false
  end

  def winner?(board, mark)
    horizontal?(board, mark) or vertical?(board, mark) or diagonal_major?(board, mark) or diagonal_minor?(board, mark)
  end

  def terminal?(board)
    winner?(board, "x") or winner?(board, "o") or full?(board)
  end
  
  def valid?(board, loc)
    board[loc] == "-" and loc > -1 and loc < board.length
  end

end
