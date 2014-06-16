require 'player_manager'

describe Player_manager do
  let(:p) {Player_manager.new("x", "o")}
  
  it "reports opposing player" do
    p.other_mark("x").should eq("o")
  end

  it "reports opposing player" do
    p.other_mark("x").should eq("o")
  end
  
end
