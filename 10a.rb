# frozen_string_literal: true

require "debug"

input = File.read("10.input").split

CORRUPT_PAIRS = ["(]", "(}", "(>", "{)", "{]", "{>", "[)", "[}", "[>", "<)", "<]", "<}"].freeze
POINTS        = { ")" => 3, "]" => 57, "}" => 1197, ">" => 25_137 }.freeze

SCORE = CORRUPT_PAIRS.map { |pair| [pair, POINTS[pair[-1]]] }.to_h

score = input.sum do |line|
  loop do
    line_before = line
    line = line.gsub(/(\(\)|\{\}|<>|\[\])/, "")

    break if line_before == line
  end

  SCORE[CORRUPT_PAIRS.find { |pair| line.include?(pair) }] || 0
end

puts score == 362_271
