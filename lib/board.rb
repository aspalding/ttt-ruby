require 'state'
require 'ai'

class Board
  attr_reader :board
  @state
  @ai

  def initialize(n)
    @board = Array.new(n*n, "-")
    @ai = Ai.new("o")
    @state = State.new
  end

  def place(mark, loc)
    @board[loc] = mark if valid?(loc)
    @board
  end

  def valid?(loc)
    @board[loc] == "-" and loc > -1 and loc < @board.length
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

  def game_over(mark)
    if @state.winner?(@board, mark)
      puts show_board
      puts mark + " is the winner!"
    else
      puts show_board
      puts "Tie game!"
    end
  end

  def which_turn(mark)
    if mark == @ai.mark
      @ai.smart_move(value_board)
      place(@ai.mark, @ai.choice)
    else
      human_move(@state.other_mark(@ai.mark))
    end
  end

  def value_board
    @board.clone
  end

  def run(mark)
    if @state.terminal?(@board)
      game_over(@state.other_mark(mark))
    else
      puts show_board
      which_turn(mark)
      run(@state.other_mark(mark))
    end
  end

end
