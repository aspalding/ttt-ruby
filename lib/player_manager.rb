require 'ai'

class Player_manager
  attr_reader :first, :second, :ai_one, :ai_two

  def initialize(first, second)
    @first = first
    @second = second
  end
  
  def other_mark(mark)
    if mark == @first
      @second
    else
      @first
    end
  end
end
