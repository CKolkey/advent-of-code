# frozen_string_literal: true

require "debug"
input = File.read("3.input")

# Part 1
# input = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
#
def mul(a, b) = a * b
puts input.scan(/mul\(\d+,\d+\)/).sum(&method(:eval)) # 153_469_856

# Part 2
# input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
#
sum = 0
instructions = input.scan(/(mul\(\d+,\d+\)|do\(\)|don't\(\))/).flatten.map do |fn|
  case fn
  when "do()"    then "start()"
  when "don't()" then "stop()"
  else                fn
  end
end

@skip = false
sum = 0

def mul(a, b) = @skip ? 0 : a * b
def start     = (@skip = false; 0)
def stop      = (@skip = true; 0)

sum += eval(instructions.shift) until instructions.empty?
puts sum # 77_055_967
