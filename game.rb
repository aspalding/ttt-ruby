$: << File.expand_path('../lib', __FILE__)

require 'board'
require 'console'
require 'player_manager'

board = Board.new(3)
console = Console.new(board) 

p1 = console.get_player
p2 = console.get_player

manager = Player_manager.new(p1[0], p1[1], p2[0], p2[1])

console.run(manager.first, manager)
