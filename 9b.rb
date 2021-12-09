# frozen_string_literal: true

require "debug"
require "set"
require "benchmark"

x = Benchmark.measure do
  input = File.read("9.input")
  # input = "2199943210\n3987894921\n9856789892\n8767896789\n9899965678"

  input = input.split.map(&:chars).map { |row| row.map(&:to_i) }

  @points = {}

  input.each_with_index do |line, index|
    line.each_with_index do |n, i|
      next unless n < (line[i + 1] || 9) &&
                  n < (line[i - 1] || 9) &&
                  n < (input[index - 1]&.slice(i) || 9) &&
                  n < (input[index + 1]&.slice(i) || 9)

      @points[[index, i]] = Set.new
    end
  end

  # At this point we don't care about the numbers anymore.
  # testing truthy/falsy in #valid_location? is _way_ faster than != 9
  #
  # (  0.235539) with n != 9
  # (  0.050858) with n as boolean
  @input = input.map { |row| row.map { |c| c != 9 } }

  def valid_location?(row, col)
    (0..@input.count).cover?(row) && (0..@input.first.count).cover?(col) && @input[row]&.slice(col)
  end

  def fill(key, row, col)
    return if !valid_location?(row, col) || @points[key].include?([row, col])

    @points[key] << [row, col]

    fill(key, row + 1, col)
    fill(key, row - 1, col)
    fill(key, row, col + 1)
    fill(key, row, col - 1)
  end

  @points.each_key { |(row, col)| fill([row, col], row, col) }
  @points.values.map(&:size).sort.last(3).reduce(&:*)
end

puts x
# 1_045_660
