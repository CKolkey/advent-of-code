# frozen_string_literal: true

require "set"

RULES = File.readlines("7.input").map do |rule|
  rule.gsub(/bags?\.?/, "")
      .split("contain")
      .map(&:strip)
      .map.with_index { |str, indx| indx.zero? ? str : str.split(",").map(&:strip) }
end.to_h

def find_containers_for(bag)
  RULES.select { |_, v| v.any? { |contents| contents.include? bag } }.keys
end

def map_find_containers_for(bags)
  bags.map { |bag| find_containers_for(bag) }.flatten.to_set
end

bags = find_containers_for("shiny gold").to_set
loop do
  count = bags.size
  bags += map_find_containers_for(bags)
  break if count == bags.size
end

puts bags.size
