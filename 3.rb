# frozen_string_literal: true

input = File.read("3.input")

def mul(a, b) = a * b

# Part 1
# input = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
#
puts input.scan(/mul\(\d+,\d+\)/).sum(&method(:eval))

# Part 2
# input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
#
instructions = input.scan(/(mul\(\d+,\d+\)|do\(\)|don't\(\))/).flatten
skip = false
sum = 0

until instructions.empty?
  case (instruction = instructions.shift)
  when "don't()"
    skip = true
    next
  when "do()"
    skip = false
    next
  end
  next if skip

  sum += eval(instruction)
end

puts sum
