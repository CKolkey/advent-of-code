# frozen_string_literal: true

require "debug"

input = Hash.new(0).merge(File.read("6.input").split(",").map(&:to_i).tally)

256.times do
  input = Hash.new(0).tap do |tmp|
    9.times do |n|
      if n.zero?
        tmp[8] = tmp[6] = input[0]
      else
        tmp[n - 1] += input[n]
      end
    end
  end
end

p input.values.sum == 1_738_377_086_345
