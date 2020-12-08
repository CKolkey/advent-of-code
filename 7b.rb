# frozen_string_literal: true

RULES = File.readlines("7.input").map do |rule|
  rule.gsub(/bag(s|)(\.|)/, "")
      .split("contain")
      .map(&:strip)
      .map.with_index { |r, i| i.zero? ? r : r.split(",") }
end.to_h

class Bag
  def initialize(name)
    @name     = name
    @contents = []

    fill_contents
  end

  def quantify_contents
    inventory_map.flatten.sum
  end

  protected

  def fill_contents
    RULES.fetch(@name, nil)&.each do |bag|
      bag.to_i.times { @contents << Bag.new(bag.split[1..].join(" ")) }
    end
  end

  def inventory_map
    @contents.any? ? @contents.map { |child| [1, child.inventory_map] } : 0
  end
end

# 220149
p Bag.new("shiny gold").quantify_contents
