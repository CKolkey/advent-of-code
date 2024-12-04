# frozen_string_literal: true

require "debug"

input = File.read("6.input").split(",").map(&:to_i)

80.times do
  zeros = input.count(0)
  input.delete_if(&:zero?)

  input.map! { |n| n - 1 }
  zeros.times do
    input.append(6)
    input.append(8)
  end
end

p input.count
