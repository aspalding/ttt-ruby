require 'board'
require 'console'
require 'stringio'

describe Console do
  let(:b) {Board.new(3)}
  let(:c) {Console.new(b)}

  it "outputs pretty board" do
    pretty_board = "\n- | - | -\n- | - | -\n- | - | -\n\n"
    c.show_board.should eq(pretty_board)

    board = Board.new(4)
    console = Console.new(board)
    pretty_board = "\n- | - | - | -\n- | - | - | -\n- | - | - | -\n- | - | - | -\n\n" 
    console.show_board.should eq(pretty_board)
  end

  it "spits out an invalid integer if user inputs bogus value" do
    c.cast_int("jlsfd;l").should eq(-1)
    c.cast_int("").should eq(-1)
  end

end
