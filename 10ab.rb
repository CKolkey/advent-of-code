# frozen_string_literal: true

require "debug"

CORRUPT  = ["(]", "(}", "(>", "{)", "{]", "{>", "[)", "[}", "[>", "<)", "<]", "<}"].freeze
POINTS_A = { ")" => 3, "]" => 57, "}" => 1197, ">" => 25_137 }.freeze
POINTS_B = { "(" => 1, "[" => 2, "{" => 3, "<" => 4 }.freeze

SCORE = CORRUPT.map { |pair| [pair, POINTS_A[pair[-1]]] }.to_h

def clean(line)
  if line == (cleaner = line.gsub(/(\(\)|\{\}|<>|\[\])/, ""))
    line
  else
    clean(cleaner)
  end
end

def purify(line)
  CORRUPT.any? { |pair| line.include?(pair) } ? nil : line.reverse.chars
end

def score_a(line)
  SCORE[CORRUPT.find { |pair| line.include?(pair) }] || 0
end

def score_b(line)
  line.inject(0) { |score, n| (score * 5) + POINTS_B[n] }
end

input = File.read("10.input").split.map(&method(:clean))

score_a = input.sum(&method(:score_a))
score_b = input.map(&method(:purify))
               .compact
               .map(&method(:score_b))
               .sort

puts score_a == 362_271
puts score_b[(score_b.length / 2)] == 1_698_395_182
