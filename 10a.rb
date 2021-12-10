# frozen_string_literal: true

require "debug"

CORRUPT_PAIRS = ["(]", "(}", "(>", "{)", "{]", "{>", "[)", "[}", "[>", "<)", "<]", "<}"].freeze
POINTS = { ")" => 3, "]" => 57, "}" => 1197, ">" => 25_137 }.freeze

SCORE = CORRUPT_PAIRS.map { |pair| [pair, POINTS[pair[-1]]] }.to_h

def clean(line)
  loop do
    line_before = line
    line = line.gsub(/(\(\)|\{\}|<>|\[\])/, "")

    break if line_before == line
  end

  line
end

def score(line)
  SCORE[CORRUPT_PAIRS.find { |pair| line.include?(pair) }] || 0
end

score = File.read("10.input")
            .split
            .map(&method(:clean))
            .sum(&method(:score))

puts score == 362_271
