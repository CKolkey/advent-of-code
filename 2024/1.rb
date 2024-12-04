# frozen_string_literal: true

def read_input
  File.read("1.input")
      .split("\n")
      .map(&:split)
      .transpose
      .map { _1.map(&:to_i).sort }
end

# Part 1
left, right = read_input
delta = 0
delta += (left.pop - right.pop).abs until left.empty?
puts delta

# Part 2
left, right = read_input
puts left.sum { right.count(_1) * _1 }
