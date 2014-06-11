require 'state'

class Ai
  attr_accessor :mark
  attr_accessor :choice
  @state

  def initialize(player)
    @mark = player
    @state = State.new
  end

  def score(board)
    if @state.winner?(board, @state.other_mark(@mark))
      -10
    elsif @state.winner?(board, @mark)
      10
    else
      0
    end
  end

  def score_move(board, mark, maximizing)
    return score(board) if @state.terminal?(board)
    best_score = 0
    @state.empty_indices(board).each do |move|
      board[move] = mark if maximizing
      board[move] = mark if !maximizing
      current_score = -score_move(board.clone, @state.other_mark(mark), !maximizing)
      best_score = max_score(current_score, best_score, move)
      board[move] = "-"
    end
    return best_score
  end

  def max_score(current, best, move)
    best = [current, best].max
    @choice = move if best == current
    best
  end

  def smart_move(board)
    if board[4] == "-"
      @choice = 4
    elsif board[4] == "x" 
      special_case(board)
    else
      score_move(board, @mark, true)
    end
  end

  def special_case(board)
    if board[3] == "x" and @state.valid?(board, 5) 
      @choice = 5 
    elsif board[5] == "x" and @state.valid?(board, 3) 
      @choice = 3 
    elsif board[1] == "x" and @state.valid?(board, 7) 
      @choice = 7
    elsif board[7] == "x" and @state.valid?(board, 1) 
      @choice = 1 
    else
      score_move(board, @mark, true)
    end
  end

end
