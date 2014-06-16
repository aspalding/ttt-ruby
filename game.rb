$: << File.expand_path('../lib', __FILE__)

require 'board'
require 'console'
require 'player_manager'

puts "enter first mark"
first_marker = gets.chomp[0]

puts "enter second mark"
second_marker = gets.chomp[0] #This won't catch \n or -

manager = Player_manager.new(first_marker, second_marker)

board = Board.new(3)
ai = Ai.new(manager.second, manager)

console = Console.new(board, ai) 

console.run(manager.first, manager)
