# frozen_string_literal: true

require "debug"

# test_input = "acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf"
input = File.read("8.input")

class Display
  attr_reader :numbers

  def initialize(signal, value)
    @signal  = signal.map { |word| word.chars.sort.join }
    @value   = value.map { |word| word.chars.sort.join }
    @numbers = {}
  end

  def call
    map_signal_to_number
    self
  end

  def output
    @value.map { |number| numbers.invert[number] }.compact
  end

  private

  def map_signal_to_number
    @signal.each do |input|
      case input.length
      when 2
        @numbers[1] = input
      when 3
        @numbers[7] = input
      when 4
        @numbers[4] = input
      when 7
        @numbers[8] = input
      else
        # do stuff
      end
    end
  end
end

displays = input.split("\n").map { Display.new(*_1.split(" | ").map(&:split)).call }

puts displays.map(&:output).flatten.count
