# frozen_string_literal: true

require "debug"
require "benchmark"

time = Benchmark.measure do
  input = Hash.new(0).merge(File.read("6.input").split(",").map(&:to_i).tally)

  # 256.times do
  #   input = Hash.new(0).tap do |tmp|
  #     9.times do |n|
  #       if n.zero?
  #         tmp[8] = tmp[6] = input[0]
  #       else
  #         tmp[n - 1] += input[n]
  #       end
  #     end
  #   end
  # end

  256.times do
    input.transform_keys! { _1 - 1}
    tmp = input[-1]
    input[6] += tmp
    input[8] = tmp
    input.delete(-1)
  end

  input.values.sum
end

puts time

time = Benchmark.measure do
  data = "5,1,1,1,3,5,1,1,1,1,5,3,1,1,3,1,1,1,4,1,1,1,1,1,2,4,3,4,1,5,3,4,1,1,5,1,2,1,1,2,1,1,2,1,1,4,2,3,2,1,4,1,1,4,2,1,4,5,5,1,1,1,1,1,2,1,1,1,2,1,5,5,1,1,4,4,5,1,1,1,3,1,5,1,2,1,5,1,4,1,3,2,4,2,1,1,4,1,1,1,1,4,1,1,1,1,1,3,5,4,1,1,3,1,1,1,2,1,1,1,1,5,1,1,1,4,1,4,1,1,1,1,1,2,1,1,5,1,2,1,1,2,1,1,2,4,1,1,5,1,3,4,1,2,4,1,1,1,1,1,4,1,1,4,2,2,1,5,1,4,1,1,5,1,1,5,5,1,1,1,1,1,5,2,1,3,3,1,1,1,3,2,4,5,1,2,1,5,1,4,1,5,1,1,1,1,1,1,4,3,1,1,3,3,1,4,5,1,1,4,1,4,3,4,1,1,1,2,2,1,2,5,1,1,3,5,2,1,1,1,1,1,1,1,4,4,1,5,4,1,1,1,1,1,2,1,2,1,5,1,1,3,1,1,1,1,1,1,1,1,1,1,2,1,3,1,5,3,3,1,1,2,4,4,1,1,2,1,1,3,1,1,1,1,2,3,4,1,1,2"

  data = data.split(",").map(&:to_i).tally

  fishes = Hash.new(0).merge(data)

  256.times do
    tmp = fishes[0]
    (0..5).each { |i| fishes[i] = fishes[i + 1] }
    fishes[6] = fishes[7] + tmp
    fishes[7] = fishes[8]
    fishes[8] = tmp
  end

  fishes.values.sum
end

puts time
