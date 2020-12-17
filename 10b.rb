# frozen_string_literal: true

require "set"

((c = File.readlines("10.input").map(&:to_i)) + [0, c.max + 3]).to_set.tap { |chargers| p Hash.new { |hash, x| x.zero? ? 1 : hash[x] = ((x - 3)...x).filter { |i| chargers.include? i }.sum { |i| hash[i] } }[chargers.max + 3] }

# 1_727_094_849_536

CHARGERS = ((c = File.readlines("10.input").map(&:to_i)) + [0, c.max + 3]).to_set
