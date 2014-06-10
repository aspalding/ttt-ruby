require 'state'
require 'board'
require 'ai'

describe Ai do
  let(:a) {Ai.new("o")}

  it "scores a winning game 10" do
    board = ["o", "o", "o","-","-","-","-","-","-"]
    a.score(board).should eq(10)
  end

  it "scores a losing game -10" do
    board = ["x", "x", "x","-","-","-","-","-","-"]
    a.score(board).should eq(-10)
  end

  it "scores a draw 0" do
    board = ["x", "o", "x","x","o","o","o","x","x"]
    a.score(board).should eq(0)
  end

  it "if game is over, return the score for that branch" do
    board = ["o", "o", "o","-","-","-","-","-","-"]
    a.score_move(board, true).should eq(10)
    board = ["x", "x", "x","-","-","-","-","-","-"]
    a.score_move(board, true).should eq(-10)
    board = ["x", "o", "x","x","o","o","o","x","x"]
    a.score_move(board, true).should eq(0)
  end

  it "should take the correct move" do 
    board = ["x", "x", "-","-","o","-","-","-","-"]
    a.score_move(board, true)
    a.choice.should eq(2)

    board = ["x", "o", "-","-","x","-","-","-","-"]
    a.score_move(board, true)
    a.choice.should eq(8)

    board = ["o", "o", "x","-","-","-","x","-","-"]
    a.score_move(board, true)
    a.choice.should eq(4) 
    
    board = ["-", "-", "o","-","o","x","x","-","x"]
    a.score_move(board, true)
    a.choice.should eq(7) 
    
    #- | - | o
    #- | o | x      PASS
    #x | - | x

    board = ["x", "x", "o","-","o","-","x","-","-"]
    a.score_move(board, true)
    a.choice.should eq(3) # got five
    
    #x | x | o
    #- | o | -      FAILS
    #x | - | -
  end

end
