# frozen_string_literal: true

# Part 1
p File.read("6.input")
      .split("\n\n")
      .map { |a| a.scan(/\S/).uniq.length }
      .sum


# part 2 (2947)
p File.read("6.input")
      .split("\n\n")
      .map(&:split)
      .map { |arr| arr.map { |a| a.scan(/\S/) }.inject(:&).length }
      .sum
