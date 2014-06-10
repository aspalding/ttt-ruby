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

  def score_move(board, maximizing)
    return score(board) if @state.terminal?(board)
    if maximizing
      best_score = -1.0/0
      @state.empty_indices(board).each do |move|
        board[move] = @mark
        current = score_move(board.clone, false)
        best_score = max_score(current, best_score, move)
        board[move] = "-"
      end
      return best_score
    else
      best_score = 1.0/0
      @state.empty_indices(board).each do |move|
        board[move] = @state.other_mark(@mark)
        current = score_move(board.clone, true)
        best_score = min_score(current, best_score, move)
        board[move] = "-"
      end
      return best_score
    end
  end

  def max_score(current, best, move)
    best = [current, best].max
    @choice = move if best == current
    best
  end

  def min_score(current, best, move)
    best = [current, best].min
    @choice = move if best == current
    best
  end

  def smart_move(board)
    score_move(board, true)
  end

end
