# frozen_string_literal: true

require "debug"

def test(input, expectation = nil, cycles = 1)
  cycles.times do
    next_round = {}

    input.each do |value, count|
      result = tick(value)
      result.each do |r|
        next_round[r] ||= 0
        next_round[r] += count
      end
    end

    input = next_round
  end

  return input if expectation.nil?
  return if input == expectation.reject { _2.zero? }

  raise "\n\nGot: #{input}\nExp: #{expectation}"
end

def process(input)
  input.split.map(&:to_i).tally
end

def tick(value)
  if value.zero?
    [1]
  elsif value.digits.size.even?
    str = value.to_s
    [
      str[...(str.size / 2)].to_i,
      str[(str.size / 2)..].to_i
    ]
  else
    [value * 2024]
  end
end

# Tests
test(process("0 1 10 99 999"), process("1 2024 1 0 9 9 2021976"))
test(process("125 17"), process("253000 1 7"))
test(process("253000 1 7"), process("253 0 2024 14168"))
test(process("253 0 2024 14168"), process("512072 1 20 24 28676032"))
test(process("512072 1 20 24 28676032"), process("512 72 2024 2 0 2 4 2867 6032"))
test(process("512 72 2024 2 0 2 4 2867 6032"), process("1036288 7 2 20 24 4048 1 4048 8096 28 67 60 32"))
test(
  process("1036288 7 2 20 24 4048 1 4048 8096 28 67 60 32"),
  process("2097446912 14168 4048 2 0 2 4 40 48 2024 40 48 80 96 2 8 6 7 6 0 3 2")
)

raise "it broke" unless test(process("125 17"), nil, 25).values.sum == 55_312

puts test(process("510613 358 84 40702 4373582 2 0 1584"), nil, 25).values.sum #             217_812
puts test(process("510613 358 84 40702 4373582 2 0 1584"), nil, 75).values.sum # 259_112_729_857_522
