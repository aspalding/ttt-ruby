class State
  def initialize
  end

  def empty_indices(board)
    indices = []
    for i in 0..board.length - 1
      if board[i] == "-"
        indices.push(i)
      end
    end
    indices
  end

  def full?(board)
    empty_indices(board) == []
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
    result = false
    for i in 0..board.length - 1
      if i % 3 == 0
        count = 0
      end
      if board[i] == mark
        count += 1
        if count == 3
          result = true
        end
      end
    end
    result
  end

  def vertical?(board, mark)
    result = false
    for i in 0..2
      if board[i] == mark and board[i + 3] == mark and board[i + 6] == mark
        result = true
      end
    end
    result
  end

  def diagonal?(board, mark)
    (board[0] == mark and board[4] == mark and board[8] == mark) ||
     (board[2] == mark and board[4] == mark and board[6] == mark)
  end

  def winner?(board, mark)
    horizontal?(board, mark) or vertical?(board, mark) or diagonal?(board, mark)
  end

  def terminal?(board)
    winner?(board, "x") or winner?(board, "o") or full?(board)
  end

end
