$: << File.expand_path('../lib', __FILE__)

require 'board'
require 'console'
require 'player_manager'
require 'io_helper'

console = Console.new(IoProd.new) 

@p1
@p2

loop do
  @p1 = console.get_player
  @p2 = console.get_player
  break if @p1[0] != @p2[0]
  puts "the marks cannot be the same."
end

console.get_size

manager = Player_manager.new(@p1[0], @p1[1], @p2[0], @p2[1])

console.run(manager)
