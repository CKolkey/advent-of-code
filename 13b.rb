# frozen_string_literal: true

require "debug"

class Array
  def ^(other)
    map.with_index { |n, i| n || other[i] }
  end
end

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
    when "x" then fold_x(line)
    when "y" then fold_y(line)
    end
  end

  def fold_x(line)
    @grid = grid.transpose
    fold_y(line)
    @grid = grid.transpose
  end

  def fold_y(line)
    top    = grid.slice(...line)
    bottom = grid.slice((line + 1)..).reverse

    @grid = top.map.with_index do |row, row_i|
      row.map.with_index do |col, col_i|
        col || bottom[row_i][col_i]
      end
    end
  end

  def print
    puts grid.map { |row| row.map { _1 ? "#" : " " }.join(" ") }.join("\n")
  end

  private

  def grid
    @grid ||= Array.new(@rows) { Array.new(@columns) { false } }
  end
end

dots, folds = File.read("13.input").split("\n\n")

grid = Grid.new(dots).build!

folds.scan(/([x,y])=(\d+)/).map { [_1.first, _1.last.to_i] }
     .each { |fold| grid.fold(*fold) }

grid.print
