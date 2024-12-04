# frozen_string_literal: true

require "debug"
require "benchmark"

module ArrayExtension
  def avg
    sum.fdiv(length)
  end
end
Array.include(ArrayExtension)

module NumericExtenstion
  def to_range(delta)
    (to_i - delta)..(to_i + delta)
  end
end
Numeric.include(NumericExtenstion)

x = Benchmark.measure do
  input = File.read("7.input").split(",").map(&:to_i)

  puts(input.avg.to_range(1).map do |n|
    input.sum do |position|
      pos = (n - position).abs
      pos * (pos + 1) / 2
    end
  end.min)

  # puts fuel == 91_638_945

  # cache = {}
  # min = (1..input.max).map do |n|
  #   input.sum do |pos|
  #     cache[[n, pos].sort] || cache[[n, pos].sort] = (1..(n - pos).abs).sum
  #   end
  # end.min
  # puts min == 91_638_945
end

puts x
