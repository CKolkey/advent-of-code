# frozen_string_literal: true

INPUT = File.read("6.input").split("\n\n")

# Part 1
p(INPUT.sum { |a| a.scan(/\S/).uniq.length })

# part 2 (2947)
p(INPUT.map(&:split).sum { |arr| arr.map(&:chars).inject(:&).length })
