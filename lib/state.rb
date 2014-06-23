class State
  def initialize(manager)
    @manager = manager
  end

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
    full?(board) && !winner?(board, @manager.first) && !winner?(board, @manager.second) 
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
    for i in Integer(Math.sqrt(board.size) - 1)..board.size - (Math.sqrt(board.size))
      count += 1 if (i % (Math.sqrt(board.size) - 1)) == 0 and board[i] == mark
      return true if count == Math.sqrt(board.size)
    end
    return false
  end

  def winner?(board, mark)
    horizontal?(board, mark) || vertical?(board, mark) || diagonal_major?(board, mark) || diagonal_minor?(board, mark)
  end

  def terminal?(board)
    winner?(board, @manager.first) || winner?(board, @manager.second) || tie?(board)
  end
  
  def valid?(board, loc)
    board[loc] == "-" || loc > -1 || loc < board.length
  end

end
