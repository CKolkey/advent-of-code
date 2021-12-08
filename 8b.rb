# frozen_string_literal: true

require "debug"

input = File.read("8.input")
test_input = File.read("8.test.input")

class Display
  attr_reader :numbers

  def initialize(signal, value)
    @signal  = signal.map { |word| word.chars.sort.join }
    @value   = value.map { |word| word.chars.sort.join }
    @numbers = {}
  end

  def call
    map_easy
    map_three
    map_zero
    map_nine
    map_six
    map_five
    map_two
    self
  end

  def output
    @value.map { |number| numbers.invert[number].to_s }.join.to_i
  end

  private

  def map_easy
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
      end
    end
  end

  def map_three
    @numbers[3] = @signal.select { |n| n.length == 5 && numbers[7].chars.all? { |c| n.include?(c) } }.first
  end

  def map_zero
    tmp = @signal.select { |n| n.length == 6 }
    tmp = tmp.reject do |n|
      n.include? numbers[4].chars
                           .delete_if { numbers[1].include? _1 }
                           .select { numbers[3].include? _1 }
                           .first
    end

    @numbers[0] = tmp.first
  end

  def map_nine
    @numbers[9] = @signal.select do |n|
      n.length == 6 &&
        !numbers.values.include?(n) &&
        numbers[3].chars.all? { n.include?(_1) }
    end.first
  end

  def map_six
    @numbers[6] = @signal.select { |n| n.length == 6 && !numbers.values.include?(n) }.first
  end

  def map_five
    missing = numbers[4].chars.reject { |c| numbers[6].include? c }.first
    @numbers[5] = numbers[9].chars.reject { |c| c == missing }.sort.join
  end

  def map_two
    @numbers[2] = @signal.select { |n| n.length == 5 && !numbers.values.include?(n) }.first
  end
end

puts(input.split("\n").map { Display.new(*_1.split(" | ").map(&:split)).call }.sum(&:output) == 1_097_568)

# test_displays = test_input.split("\n").map { Display.new(*_1.split(" | ").map(&:split)).call }
# test_outputs = [8394, 9781, 1197, 9361, 4873, 8418, 4548, 1625, 8717, 4315]

# test_displays.each_with_index do |display, i|
#   puts "Actual:   #{display.output}"
#   puts "Expected: #{test_outputs[i]}"
#   puts "Passing:  #{display.output == test_outputs[i]}"
#   puts "----"
# end
