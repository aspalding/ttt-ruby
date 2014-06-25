require 'board'
require 'console'
require 'io_helper'

describe Console do
  let(:b) {Board.new(3)}
  let(:c) {Console.new(IoFake.new)}

  #it "outputs pretty board" do
  #  pretty_board = "\n- | - | -\n- | - | -\n- | - | -\n\n"
  #  c.show_board.should eq(pretty_board)

  #  console = Console.new(IoFake.new)
  #  pretty_board = "\n- | - | - | -\n- | - | - | -\n- | - | - | -\n- | - | - | -\n\n" 
  #  console.show_board.should eq(pretty_board)
  #end

  it "spits out an invalid integer if user inputs bogus value" do
    c.cast_int("jlsfd;l").should eq(-1)
    c.cast_int("").should eq(-1)
  end

# UPON ENTERING A BLANK SIZED BOARD
#
#  /Users/andrew/Documents/ttt-ruby/lib/state.rb:70:in `%': divided by 0 (ZeroDivisionError)
#    from /Users/andrew/Documents/ttt-ruby/lib/state.rb:70:in `block in diagonal_minor?'
#      from /Users/andrew/Documents/ttt-ruby/lib/state.rb:69:in `each'
#        from /Users/andrew/Documents/ttt-ruby/lib/state.rb:69:in `diagonal_minor?'
#          from /Users/andrew/Documents/ttt-ruby/lib/state.rb:77:in `winner?'
#            from /Users/andrew/Documents/ttt-ruby/lib/state.rb:81:in `terminal?'
#              from /Users/andrew/Documents/ttt-ruby/lib/console.rb:83:in `game_loop'
#                from /Users/andrew/Documents/ttt-ruby/lib/console.rb:93:in `run'
#                  from game.rb:17:in `<main>'
#
end
