require 'state'
require 'ai'

class Console

  def initialize(first, board)
    @board =  board
    if first
      @ai = Ai.new("o")
    else
      @ai = Ai.new("x")
    end
    @state = State.new
  end

  def show_board
    "\n%s | %s | %s\n%s | %s | %s\n%s | %s | %s\n\n" % @board.board
  end

  def human_move(mark)
    puts "Enter a valid move (0..8)"
    location = cast_input(gets.chomp)
    if @board.valid?(location)
      @board.place(mark, location)
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
    if @state.winner?(@board.board, mark)
      puts show_board
      puts mark + " is the winner!"
    else
      puts show_board
      puts "Tie game!"
    end
  end

  def which_turn(mark)
    if mark == @ai.mark
      @ai.smart_move(@board.value_board)
      @board.place(@ai.mark, @ai.choice)
    else
      human_move(@state.other_mark(@ai.mark))
    end
  end

  def run(mark)
    if @state.terminal?(@board.board)
      game_over(@state.other_mark(mark))
    else
      puts show_board
      which_turn(mark)
      run(@state.other_mark(mark))
    end
  end
end
