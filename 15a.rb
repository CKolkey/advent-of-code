# frozen_string_literal: true

require "debug"
require_relative "priority_queue"

input = <<~EOF
  1163751742
  1381373672
  2136511328
  3694931569
  7463417111
  1319128137
  1359912421
  3125421639
  1293138521
  2311944581
EOF

# input = File.read("15.input")

MAP = input.split
           .map { _1.chars.map(&:to_i) }
           .map.with_index { |row, row_i| row.map.with_index { |col, col_i| [[row_i, col_i], col] } }
           .flatten(1)
           .to_h
           .freeze

binding.b
queue = []
queue << [0, 0]

path = Hash.new(Float::INFINITY)
path[[0, 0]] = 0

steps = 0
until queue.empty?
  steps += 1

  x, y = queue.shift
  risk = path[[x, y]]

  [[x + 1, y], [x - 1, y], [x, y + 1], [x, y - 1]].each do |next_node|
    next unless MAP[next_node]

    if risk + MAP[next_node] < path[next_node]
      path[next_node] = risk + MAP[next_node]
      queue << next_node
    end
  end
end

puts "\n"
puts "Total Loops: #{steps}"
puts "Risk at goal: #{path[MAP.keys.max]}"
