# frozen_string_literal: true

require "debug"

class Line
  attr_reader :x1, :y1, :x2, :y2

  def initialize(start, stop)
    @x1, @y1 = start.split(",").map(&:to_i)
    @x2, @y2 = stop.split(",").map(&:to_i)
  end

  def points
    if horizontal?
      plot_flat_points(*[y1, y2].sort, ->(n) { [x1, n] })
    elsif vertical?
      plot_flat_points(*[x1, x2].sort, ->(n) { [n, y1] })
    elsif diagonal?
      plot_diagonal_points
    end
  end

  # A: horizontal? || vertical?
  # B: horizontal? || vertical? || diagonal?
  def valid?
    horizontal? || vertical? || diagonal?
  end

  private

  def horizontal? = x1 == x2
  def vertical?   = y1 == y2
  def diagonal?   = slope.abs == 1
  def slope       = (y2 - y1) / (x2 - x1)

  def plot_flat_points(min, max, func)
    (min..max).to_a.map(&func)
  end

  def plot_diagonal_points
    min_y, max_y = [y1, y2].sort
    min_x, max_x = [x1, x2].sort

    y_axis = (min_y..max_y).to_a
    y_axis = y_axis.reverse if slope.negative?

    (min_x..max_x).to_a.zip(y_axis)
  end
end

puts File.read("5.input")
         .split("\n")
         .map { |line| Line.new(*line.split(" -> ")) }
         .select(&:valid?)
         .map(&:points)
         .flatten(1)
         .tally
         .select { |_, v| v > 1 }
         .count

# A: 4826
# B: 16793
