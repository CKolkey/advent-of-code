# frozen_string_literal: true

require "debug"

input = File.read("9.input")
# input = "2199943210\n3987894921\n9856789892\n8767896789\n9899965678"

input = input.split.map(&:chars).map { |row| row.map(&:to_i) }

low_points = []

input.each_with_index do |line, index|
  line.each_with_index do |n, i|
    next unless n < (line[i + 1] || 9) &&
                n < (line[i - 1] || 9) &&
                n < (input[index - 1]&.slice(i) || 9) &&
                n < (input[index + 1]&.slice(i) || 9)

    low_points << (n + 1)
  end
end

puts low_points.sum
