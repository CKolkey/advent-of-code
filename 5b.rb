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
  def initialize(col_input, row_input)
    @col_input = col_input.split("").map { |i| i == "L" ? 0 : 1 }
    @row_input = row_input.split("").map { |i| i == "F" ? 0 : 1 }
  end

  def seat_id
    find_row * 8 + find_column
  end

  private

  def find_column
    BSearcher.new((0..7).to_a, @col_input).find
  end

  def find_row
    BSearcher.new((0..127).to_a, @row_input).find
  end
end

ids = PASSES.each_with_object([]) { |pass, ids| ids << SeatFinder.new(pass.slice(7, 3), pass.slice(0, 7)).seat_id }.sort
puts "Max Seat ID: #{ids.max}"
puts "My Seat ID: #{(ids.first..ids.last).sum - ids.sum}"
