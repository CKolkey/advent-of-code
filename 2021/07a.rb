# frozen_string_literal: true

require "debug"

input = File.read("7.input").split(",").map(&:to_i)

# input = [16, 1, 2, 0, 4, 2, 7, 1, 2, 14]

cache = {}

input.each do |n|
  input.each do |nn|
    key = [n, nn].sort
    cache[key] || cache[key] = (n - nn).abs
  end
end

fuel = 100_000_000_000
input.uniq.each do |hh|
  aggregate_delta = 0

  input.each { |h| aggregate_delta += cache[[h, hh].sort] }

  fuel = aggregate_delta if aggregate_delta < fuel
end

puts fuel == 336_721
