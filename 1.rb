# frozen_string_literal: true

input = File.read('1.input').split.map(&:to_i)

def calc_fuel(mass) = (mass / 3.0).floor - 2

def recursive_calc(mass, fuel = [])
  if mass <= 0
    fuel.sum
  else
    mass = calc_fuel(mass)
    fuel << mass if mass > 0
    recursive_calc(mass, fuel)
  end
end

answer_a = input.sum(&method(:calc_fuel))
answer_b = input.sum(&method(:recursive_calc))

puts "A: #{answer_a}"
puts "B: #{answer_b}"
