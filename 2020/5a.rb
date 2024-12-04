# frozen_string_literal: true

PASSES = File.readlines("5.input")

class BSearcher
  def initialize(array, instructions)
    @array        = array
    @instructions = instructions
  end

  def find
    @array = bisect_array until @instructions.empty?
    @array.first
  end

  private

  def bisect_array
    @instructions.shift.zero? ? @array.slice(front) : @array.slice(rear)
  end

  def front
    0...(@array.length / 2)
  end

  def rear
    (@array.length / 2)..-1
  end
end

class SeatFinder
  attr_reader :rows, :columns

  def initialize(col_input, row_input)
    @col_input = col_input.split("").map { |i| i == "L" ? 0 : 1 }
    @row_input = row_input.split("").map { |i| i == "F" ? 0 : 1 }
    @rows      = (0..127).to_a
    @columns   = (0..7).to_a
  end

  def seat_id
    @seat_id ||= (find_row * 8) + find_column
  end

  def find_column
    BSearcher.new(@columns, @col_input).find
  end

  def find_row
    BSearcher.new(@rows, @row_input).find
  end
end

max = 0
PASSES.each do |pass|
  finder = SeatFinder.new(pass.slice(7, 3), pass.slice(0, 7))
  max = finder.seat_id if finder.seat_id > max
end

puts max
