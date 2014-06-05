$: << File.expand_path('../lib', __FILE__)

require 'board'

board = Board.new(3)

board.run("x")
