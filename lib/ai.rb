require 'state'
require 'player_manager'

class Ai
  attr_accessor :mark
  attr_accessor :choice
  @state

  def initialize(mark, manager)
    @mark = mark
    @state = State.new(manager)
    @manager = manager
  end

  def score(board)
    if @state.winner?(board, @manager.other_mark(@mark))
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
      current_score = -score_move(board.clone, @manager.other_mark(mark), !maximizing)
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
    score_move(board, @mark, true)
  end

end
