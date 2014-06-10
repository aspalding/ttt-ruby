require 'state'
require 'board'

describe State do
  let(:b) {Board.new(3)}
  let(:s) {State.new}

  it "returns indices of empty positions on board" do
    s.empty_indices(b.board).should eq([0, 1, 2, 3, 4, 5, 6, 7, 8])
  end

  it "won't return filled positions" do
    s.empty_indices(b.place("x", 0)).should eq([1, 2, 3, 4, 5, 6, 7, 8])
  end

  it "reports if the board is full" do
    board = ["x", "o","x","o","o","o","x","o","x"]
    s.full?(board).should eq(true)
  end

  it "won't if it isn't" do
    board = ["x", "o","x","o","x","o","-","-","-"]
    s.full?(board).should eq(false)
  end

  it "reports opposing player" do
    s.other_mark("x").should eq("o")
  end

  it "reports opposing player" do
      s.other_mark("x").should eq("o")
  end

  it "reports opposing player for o as well" do
    s.other_mark("o").should eq("x")
  end

  it "reports status in horizontal row" do
    board = ["x", "x", "x","-","-","-","-","-","-"]
    s.horizontal?(board, "x").should eq(true)
    board = ["-","-","-","-","-","-","x", "x", "x"]
    s.horizontal?(board, "x").should eq(true)
    board = ["-","-","-","-","-","-","o", "x", "x"]
    s.horizontal?(board, "x").should eq(false)
  end

  it "reports status in vertical row" do
    board = ["x", "-", "-","x","-","-","x","-","-"]
    s.vertical?(board, "x").should eq(true)
    board = ["-", "-", "x","-","-","x","-","-","x"]
    s.vertical?(board, "x").should eq(true)
    board = ["x", "-", "-","-","x","-","x","-","-"]
    s.vertical?(board, "x").should eq(false)
  end

  it "reports status in diagonal row" do
    board = ["x", "-", "-","-","x","-","-","-","x"]
    s.diagonal?(board, "x").should eq(true)
    board = ["-", "-", "x","-","x","-","x","-","-"]
    s.diagonal?(board, "x").should eq(true)
    board = ["-", "-", "x","-","-","x","-","-","x"]
    s.diagonal?(board, "x").should eq(false)
  end

  it "reports winner" do
    board = ["x", "-", "-","-","x","-","-","-","x"]
    s.winner?(board, "x").should eq(true)
    board = ["x", "-", "-","x","-","-","x","-","-"]
    s.winner?(board, "x").should eq(true)
    board = ["x", "x", "x","-","-","-","-","-","-"]
    s.winner?(board, "x").should eq(true)
  end

  it "reports end of game (win or draw)" do
    board = ["x", "-", "-","-","x","-","-","-","x"]
    s.terminal?(board).should eq(true)
    board = ["x", "o", "x","x","o","x","o","x","o"]
    s.terminal?(board).should eq(true)
  end

  it "reports if the board is a tie game" do
    board = ["x", "o","x","o","o","o","x","o","x"]
    s.tie?(board).should eq(false)
  end

end
