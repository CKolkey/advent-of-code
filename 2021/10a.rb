# frozen_string_literal: true

require "debug"

CORRUPT = ["(]", "(}", "(>", "{)", "{]", "{>", "[)", "[}", "[>", "<)", "<]", "<}"].freeze
POINTS  = { ")" => 3, "]" => 57, "}" => 1197, ">" => 25_137 }.freeze

SCORE = CORRUPT.map { |pair| [pair, POINTS[pair[-1]]] }.to_h

def clean(line)
  if line == (cleaner = line.gsub(/(\(\)|\{\}|<>|\[\])/, ""))
    line
  else
    clean(cleaner)
  end
end

def score(line)
  SCORE[CORRUPT.find { |pair| line.include?(pair) }] || 0
end

score = File.read("10.input")
            .split
            .map(&method(:clean))
            .sum(&method(:score))

puts score == 362_271
