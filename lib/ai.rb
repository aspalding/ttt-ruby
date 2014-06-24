require 'state'
require 'player_manager'

class Ai
  attr_reader :mark, :choice

  def initialize(mark, manager)
    @mark = mark
    @state = State.new(manager)
    @manager = manager
  end

  def score(board, mark)
    #state = State.new(@manager)
    #if state.winner?(board, mark)
    #  10
    #elsif state.winner?(board, @manager.other_mark(mark))
    #  -10
    #else
    #  0
    #end
    if @state.tie?(board) || (!@state.winner?(board, @manager.first) && !@state.winner?(board, @manager.second))
      0
    else
      -10
    end
  end

  def score_move(board, mark, depth)
    return score(board, mark) if @state.terminal?(board) || depth == 0
    best_score = -1.0/0
    @state.empty_indices(board).each do |move|
      board[move] = mark
      current_score = -1 * score_move(board, @manager.other_mark(mark), depth - 1)
      if current_score > best_score
        @choice = move
        #puts print_debug(board)
        #puts current_score
        best_score = current_score
      end
      board[move] = "-"
    end
    return best_score
  end
  
  def print_debug(board)
    "\n%s | %s | %s\n%s | %s | %s\n%s | %s | %s\n\n" % board
  end

  def smart_move(board)
    score_move(board, @mark, 3)
  end

end
