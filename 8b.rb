# frozen_string_literal: true

require "debug"
require "set"

class Display
  attr_reader :numbers

  def initialize(signal, value)
    @signal  = signal.map { |word| word.chars.to_set }
    @value   = value.map { |word| word.chars.to_set }
    @numbers = {}
  end

  def call
    @numbers[1] = find_by_length(2)
    @numbers[7] = find_by_length(3)
    @numbers[4] = find_by_length(4)
    @numbers[8] = find_by_length(7)
    @numbers[3] = find_by_length(5) { |n| numbers[7].subset?(n) }
    @numbers[0] = find_by_length(6) { |n| !((numbers[4] - numbers[1]) & numbers[3]).subset?(n) }
    @numbers[9] = find_by_length(6) { |n| numbers.values.none? { _1 == n } && numbers[3].subset?(n) }
    @numbers[6] = find_by_length(6) { |n| numbers.values.none? { _1 == n } }
    @numbers[5] = numbers[9] - (numbers[4] - numbers[6])
    @numbers[2] = @signal.find { |n| numbers.values.none? { _1 == n } }

    self
  end

  def output
    @value.map { |number| numbers.invert[number].to_s }.join.to_i
  end

  private

  def find_by_length(length, &block)
    if block.nil?
      @signal.find { _1.length == length }
    else
      @signal.select { _1.length == length }.find(&block)
    end
  end
end

puts(File.read("8.input").split("\n").map { Display.new(*_1.split(" | ").map(&:split)).call }.sum(&:output) == 1_097_568)
