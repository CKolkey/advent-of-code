# frozen_string_literal: true

require "debug"

def process(input)
  input.split.map(&:to_i).tally
end

def cycles(first, n)
  [first] + Array.new(n) { Hash.new(0) }
end

def run(cycles)
  cycles.each_cons(2) do |previous, current|
    previous.each do |value, count|
      tick(value).each { current[_1] += count }
    end
  end
end

def tick(value)
  case value
  when 0
    [1]
  when ->(v) { v.digits.size.even? }
    str = value.to_s
    [
      str[...(str.size / 2)].to_i,
      str[(str.size / 2)..].to_i
    ]
  else
    [value * 2024]
  end
end

def score(run)
  run.last.values.sum
end

input = process("510613 358 84 40702 4373582 2 0 1584")

puts score(run(cycles(input, 25))) == 217_812
puts score(run(cycles(input, 75))) == 259_112_729_857_522
