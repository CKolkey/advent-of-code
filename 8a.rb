# frozen_string_literal: true

INSTRUCTIONS = File.readlines("8.input").map(&:split).map { |(inst, n)| [inst, n.to_i] }
accumulator  = 0
offset       = 0
execution    = {}

loop do
  inst, n = INSTRUCTIONS[offset]

  case inst
  when "acc"
    accumulator += n
    offset += 1
  when "jmp"
    offset += n
  when "nop"
    offset += 1
  end

  break if execution[offset]

  execution[offset] = [inst, n]
end

puts accumulator
