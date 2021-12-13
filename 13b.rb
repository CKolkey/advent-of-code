# frozen_string_literal: true

require "debug"

module ArrayExtension
  def ^(other)
    map.with_index { |b, i| b || other[i] }
  end
end
Array.include(ArrayExtension)

class Grid
  def initialize(dots)
    @dots    = dots.scan(/^(\d+),(\d+)$/).map { _1.map(&:to_i) }
    @columns = @dots.map(&:first).max + 1
    @rows    = @dots.map(&:last).max + 1
  end

  def build!
    @dots.each { |(col, row)| grid[row][col] = true }
    self
  end

  def fold(axis, line)
    case axis
    when "x" then fold_x!(line)
    when "y" then fold_y!(line)
    end
  end

  def print
    puts grid.map { |row| row.map { _1 ? "💩" : "  " }.join(" ") }.join("\n")
  end

  private

  def fold_x!(line)
    @grid = grid.transpose
    fold_y!(line)
    @grid = grid.transpose
  end

  def fold_y!(line)
    @grid = grid.slice(...line)
                .zip(grid.reverse.slice(...line))
                .map { |(top, bottom)| top ^ bottom }
  end

  def grid
    @grid ||= Array.new(@rows) { Array.new(@columns) { false } }
  end
end

dots, folds = File.read("13.input").split("\n\n")
grid = Grid.new(dots).build!
folds.scan(/([x,y])=(\d+)/).each { |(axis, line)| grid.fold(axis, line.to_i) }

grid.print
