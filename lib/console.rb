require 'state'
require 'ai'
require 'player_manager'

class Console

  def initialize(board, ai)
    @board =  board
    @ai = ai
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

  def game_over(mark, state)
    if state.winner?(@board.board, mark)
      puts show_board
      puts mark + " is the winner!"
    else
      puts show_board
      puts "Tie game!"
    end
  end

  def which_turn(mark, manager)
    if mark == @ai.mark
      @ai.smart_move(@board.value_board)
      @board.place(@ai.mark, @ai.choice)
    else
      human_move(manager.other_mark(@ai.mark))
    end
  #  if manager.is_ai?(mark)
  #    @ai.smart_move(@board.value_board)
  #    @board.place(@ai.mark, @ai.choice)
  #  else
  #    human_move(manager.other_mark(@ai.mark))
  #  end
  end

  def run(mark, manager)
    state = State.new(manager)
    if state.terminal?(@board.board)
      game_over(manager.other_mark(mark), state)
    else
      puts show_board
      which_turn(mark, manager)
      run(manager.other_mark(mark), manager)
    end
  end
end
