$: << File.expand_path('../lib', __FILE__)

require 'board'
require 'console'

puts "If you'd like to go first, type 'y'. For any other input you'll go second."
order_input = gets.chomp

board = Board.new(3)

console = Console.new(true, board) if order_input == "y"
console = Console.new(true, board) if order_input != "y"

console.run("x")
