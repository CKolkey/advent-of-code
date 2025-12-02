# frozen_string_literal: true

require "debug"

# 11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124
input = <<~INPUT
  516015-668918,222165343-222281089,711089-830332,513438518-513569318,4-14,4375067701-4375204460,1490-3407,19488-40334,29275041-29310580,4082818-4162127,12919832-13067769,296-660,6595561-6725149,47-126,5426-11501,136030-293489,170-291,100883-121518,333790-431800,897713-983844,22-41,42727-76056,439729-495565,43918886-44100815,725-1388,9898963615-9899009366,91866251-91958073,36242515-36310763
INPUT

input = input.split(",").map { it.split("-").map(&:to_i) }

def check_validity_part_1(start, stop)
  invalid = []

  start.upto(stop) do |number|
    str = number.to_s
    size = str.length / 2
    invalid << number if str[...size] == str[size..]
  end

  invalid
end

def check_validity_part_2(start, stop)
  invalid = Set.new

  start.upto(stop) do |number|
    chars = number.to_s.chars
    length = chars.length

    (1..(length / 2)).each do |split|
      next unless (length % split).zero?

      invalid << number if chars.each_slice(split).map(&:join).uniq.count == 1
    end
  end

  invalid.to_a
end

puts(input.flat_map { check_validity_part_1(*it) }.sum == 16_793_817_782)
puts(input.flat_map { check_validity_part_2(*it) }.sum == 27_469_417_404)
