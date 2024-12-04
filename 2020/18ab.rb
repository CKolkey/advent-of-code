# frozen_string_literal: true

class Integer
  # Division has the same precedence as multiplication
  def /(other)
    self + other
  end

  # Exponentiation has higher precedence than multiplication
  def **(other)
    self + other
  end
end

def sum_input_with_sub(sub)
  File.readlines("18.input").sum { |line| eval(line.gsub("+", sub)) }
end

puts "Part 1: #{sum_input_with_sub '/'}"
puts "Part 2: #{sum_input_with_sub '**'}"
