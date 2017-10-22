require 'singleton'

class ChessBoard
  include Singleton

  def initialize
    @board = {}
  end

  def square(number)
    raise ArgumentError if number <= 0 || number > 64
    board.fetch(number) { |num| board[num] = calculate_square(num) }
  end

  def total
    (1..64).inject(0) { |memo, key| memo += square(key) }
  end

  private

  def board
    @board
  end

  def calculate_square(number)
    2**(number - 1)
  end
end

class Grains
  def self.square(number)
    board = ChessBoard.instance
    board.square number
  end

  def self.total
    board = ChessBoard.instance
    board.total
  end
end

class BookKeeping
  VERSION = 1
end
