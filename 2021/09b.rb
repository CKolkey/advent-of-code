# frozen_string_literal: true

require "debug"
require "set"

@input     = File.read("9.input").split.map(&:chars).map { |row| row.map(&:to_i) }
@points    = {}
@basin_map = {}

@input.each_with_index do |line, index|
  line.each_with_index do |n, i|
    @basin_map[[index, i]] = n != 9

    next unless n < (line[i + 1] || 9) &&
                n < (line[i - 1] || 9) &&
                n < (@input[index - 1]&.slice(i) || 9) &&
                n < (@input[index + 1]&.slice(i) || 9)

    @points[[index, i]] = Set.new
  end
end

def fill(key, row, col)
  return unless @basin_map[[row, col]] && !@points[key].include?([row, col])

  @points[key] << [row, col]

  fill(key, row + 1, col)
  fill(key, row - 1, col)
  fill(key, row, col + 1)
  fill(key, row, col - 1)
end

@points.each_key { |(row, col)| fill([row, col], row, col) }
puts @points.values.map(&:size).max(3).reduce(&:*) == 1_045_660
