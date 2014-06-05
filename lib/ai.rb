require 'state'

class Ai
  attr_accessor :mark
  @state

  def initialize(player)
    @mark = player
    @state = State.new
  end

  def score(board)
    if @state.winner?(board, @mark)
      10
    elsif @state.winner?(board, @state.other_mark(@mark))
      -10
    else
      0
    end
  end

  def score_move(board, mark, computer)
    if @state.terminal?(board)
      score(board)
    else
        

    end
  end


end
