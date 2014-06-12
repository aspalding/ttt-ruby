require 'board'
require 'console'
require 'stringio'

describe Console do
  let(:b) {Board.new(3)}
  let(:c) {Console.new(true, b)}

  it "outputs pretty board" do
    pretty_board = "\n- | - | -\n- | - | -\n- | - | -\n\n"
    c.show_board.should eq(pretty_board)
  end

  it "spits out an invalid integer if user inputs bogus value" do
    c.cast_input("jlsfd;l").should eq(-1)
    c.cast_input("").should eq(-1)
  end

 # it "outputs status of game when called." do
 #   stdin = StringIO.new
 #   stdin.puts(c.game_over("x"))
 #   expected = ("Tie game!\n")
 #   stdin.rewind
 #   stdin.gets.should eq(expected)
 # end

  it "should let player go first or second." do

  end
end
