# frozen_string_literal: true

# Part 1
p File.read("6.input")
      .split("\n\n").sum { |a| a.scan(/\S/).uniq.length }

# part 2 (2947)
p File.read("6.input")
      .split("\n\n")
      .map(&:split).sum { |arr| arr.map { |a| a.scan(/\S/) }.inject(:&).length }
