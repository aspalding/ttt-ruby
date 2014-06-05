require 'board'

describe Board do
  let(:b) {Board.new(3)}

  it "initializes an empty board with blank (-) spaces" do
    b.board.should eq(["-", "-","-","-","-","-","-","-","-"])
  end

  it "can take an piece" do
    b.place("x", 0).should eq(["x", "-","-","-","-","-","-","-","-"])
  end

  it "index out of bounds (lower) aren't valid" do
    b.valid?(-1).should eq(false)
  end

  it "index out of bounds (greater) aren't valid" do
    b.valid?(9).should eq(false)
  end

  it "characters other than letters are not valid" do
    b.valid?("a").should eq(false)
  end

  it "characters other than letters are not valid" do
    b.place("x", 0)
    b.valid?(0).should eq(false)
  end

  it "won't place a piece in an invalid spot" do
    b.place("x", -1).should eq(["-", "-","-","-","-","-","-","-","-"])
  end

  it "won't place a piece in an invalid spot" do
    b.place("x", 11).should eq(["-", "-","-","-","-","-","-","-","-"])
  end

  it "won't place a piece in an taken position" do
    b.place("x", 0)
    b.place("o", 0).should eq(["x", "-","-","-","-","-","-","-","-"])
  end

  it "outputs pretty board" do
    pretty_board = "\n- | - | -\n- | - | -\n- | - | -\n\n"
    b.show_board.should eq(pretty_board)
  end

  it "spits out an invalid integer if user inputs bogus value" do
    b.cast_input("jlsfd;l").should eq(-1)
    b.cast_input("").should eq(-1)
  end

end
