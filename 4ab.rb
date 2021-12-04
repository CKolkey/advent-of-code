# frozen_string_literal: true

require 'debug'

class Board
  def initialize(board)
    @board = board.split("\n")
                  .map(&:split)
                  .map { |row| row.map { |number| Square.new(number.to_i) } }

    @last_mark = nil
    @winner    = false
  end

  def compute_final_score
    @board.map { |row| row.reject(&:marked?) }.flatten.sum(&:number) * @last_mark
  end

  def mark(number)
    return if winner?

    @last_mark = number

    @board.each do |row|
      row.select { |square| square.number == number }.map(&:mark!)
    end

    @winner = row_won? || column_won?
  end

  def winner?
    @winner
  end

  private

  def row_won?
    @board.any? { |row| winning_set?(row) }
  end

  def column_won?
    @board.transpose.any? { |row| winning_set?(row) }
  end

  def winning_set?(set)
    set.select(&:marked?).size == set.size
  end
end

class Square
  attr_reader :number

  def initialize(number)
    @number = number
    @marked = false
  end

  def mark!
    @marked = true
  end

  def marked?
    @marked
  end
end

NUMBERS = [
  42, 32, 13, 22, 91, 2, 88, 85, 53, 87, 37, 33, 76, 98, 89, 19, 69, 9, 62, 21, 38, 49,
  54, 81, 0, 26, 79, 36, 57, 18, 4, 40, 31, 80, 24, 64, 77, 97, 70, 6, 73, 23, 20, 47,
  45, 51, 74, 25, 95, 96, 58, 92, 94, 11, 39, 63, 65, 99, 48, 83, 29, 34, 44, 75, 55, 17,
  14, 56, 8, 82, 59, 52, 46, 90, 5, 41, 60, 67, 16, 1, 15, 61, 71, 66, 72, 30, 28, 3, 43,
  27, 78, 10, 86, 7, 50, 35, 84, 12, 93, 68
].freeze

boards = File.read('4.input').split("\n\n").map { |board| Board.new(board) }
first  = nil
last   = nil

NUMBERS.each do |number|
  boards.each do |board|
    next if board.winner?

    board.mark(number)
    next unless board.winner?

    score = board.compute_final_score
    first ||= score
    last = score
  end
end

puts "First Winner: #{first}"
puts "Last Winner: #{last}"
