board.each_slice(3).to_a #slices board into three parts.

%w(sliced[0]).all?{|mark| mark == "x"} #if all the marks are "x", true; else false.


    while !state.terminal?(@board)
      mark = "x"
      puts show_board
      human_move(mark)
      puts show_board
      human_move(state.other_mark(mark))
    end
