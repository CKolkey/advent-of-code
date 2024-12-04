# frozen_string_literal: true

p ((c = File.readlines("10.input").map(&:to_i)) + [0, c.max + 3]).sort.each_cons(2).map { |a, b| b - a }.tally.values.reduce(:*)

def test
end
