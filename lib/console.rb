require 'state'
require 'ai'
require 'player_manager'

class Console

  def initialize(board)
    @board =  board
  end

  def show_board
    if @board.board.size == 9
      "\n%s | %s | %s\n%s | %s | %s\n%s | %s | %s\n\n" % @board.board
    else
      "\n%s | %s | %s | %s\n%s | %s | %s | %s\n%s | %s | %s | %s\n%s | %s | %s | %s\n\n" % @board.board
    end
  end

  def human_move(mark)
    puts "Enter a valid move (0..8)"
    location = cast_int(gets.chomp)
    if @board.valid?(location)
      @board.place(mark, location)
    else
      human_move(mark)
    end
  end
  
  def get_player
    puts "enter your mark"
    mark = gets.chomp[0]
    puts "is this player the computer?"
    ai = true if gets.chomp[0] == "y"
    [mark, ai]
  end

  def cast_int(loc)
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
    if manager.get_player(mark) == "human"
      human_move(mark)
    else
      ai = manager.get_player(mark)
      ai.smart_move(@board.value_board)
      @board.place(ai.mark, ai.choice)
    end 
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
