class IoFake
  def output(text)
    text
  end

  def input(text)
    text 
  end
end

class IoProd
  def output(text)
    puts text
  end

  def input(text)
    gets.chomp
  end
end
