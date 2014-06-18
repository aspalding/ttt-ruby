require 'state'
require 'player_manager'

class Ai
  attr_reader :mark, :choice

  def initialize(mark, manager)
    @mark = mark
    @state = State.new(manager)
    @manager = manager
  end

  def score(board, depth)
    if @state.winner?(board, @mark)
      10
    elsif @state.winner?(board, @manager.other_mark(@mark))
      -10
    else
      0
    end
  end

  def score_move(board, mark, depth)
    return score(board, depth) if @state.terminal?(board) || depth == 0
    best_score = 0
    @state.empty_indices(board).each do |move|
      board[move] = mark
      current_score = -score_move(board.clone, @manager.other_mark(mark), depth -= 1)
      best_score = max_score(current_score, best_score, move)
      #if current_score > best_score
      #  @choice = move
      #  best_score = current_score
      #end
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
    score_move(board, @mark, 2)
  end

end
