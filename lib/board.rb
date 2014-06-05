require 'state'
require 'ai'

class Board
  attr_reader :board

  def initialize(n)
    @board = Array.new(n*n, "-")
  end

  def place(mark, loc)
    if valid?(loc)
      @board[loc] = mark
    end
    @board
  end

  def valid?(loc)
    loc.is_a? Integer and @board[loc] == "-" and loc > -1 and loc < @board.length
  end

  def show_board
    "\n%s | %s | %s\n%s | %s | %s\n%s | %s | %s\n\n" % @board
  end

  def human_move(mark)
    puts "Enter a valid move (0..8)"
    location = cast_input(gets.chomp)
    if valid?(location)
      place(mark, location)
    else
      human_move(mark)
    end
  end

  def cast_input(loc)
    begin
      location = Integer(loc)
    rescue ArgumentError
      loc = -1
    end
  end

  def game_over(state, mark)
    if state.winner?(@board, mark)
      puts mark + " is the winner!"
      @board
    else
      puts "Tie game!"
      @board
    end
  end


  def run(mark)
    state = State.new
    if state.terminal?(@board)
      game_over(state, state.other_mark(mark))
    else
      puts show_board
      human_move(mark)
      run(state.other_mark(mark))
    end
  end

end
