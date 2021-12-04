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

input   = File.read('4.input').split("\n\n")
numbers = input.first.split(',').map(&:to_i)
boards  = input.slice(1..).map { |board| Board.new(board) }

first  = nil
last   = nil

numbers.each do |number|
  boards.each do |board|
    next if board.winner?

    board.mark(number)
    next unless board.winner?

    score = last = board.compute_final_score
    first ||= score
  end
end

puts "First Winner: #{first}"
puts "Last Winner: #{last}"
