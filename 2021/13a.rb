# frozen_string_literal: true

require "debug"

def print_map(grid) = puts(grid.map { _1.map { |n| n ? "#" : "." }.join(" ") }.join("\n"))

dots, folds = File.read("13.input").split("\n\n")

dots    = dots.split.map { _1.split(",").map(&:to_i) }
columns = dots.map(&:first).max + 1
rows    = dots.map(&:last).max + 1
grid    = Array.new(rows) { Array.new(columns) { false } }

dots.each { |(col, row)| grid[row][col] = true }

folds = folds.scan(/([x,y])=(\d+)/).map { [_1.first, _1.last.to_i] }

fold = folds[0]

grid = grid.transpose

top    = grid.slice(...fold[1])
bottom = grid.slice((fold[1] + 1)..).reverse


combined = top.map.with_index do |row, row_i|
  row.map.with_index do |col, col_i|
    col || bottom[row_i][col_i]
  end
end

puts combined.flatten.count(true)
