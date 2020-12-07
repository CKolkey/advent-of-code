# frozen_string_literal: true

RULES = File.readlines("7.input").map do |rule|
          rule.gsub(/bag(s|)(\.|)/, "")
              .split("contain")
              .map(&:strip)
              .map.with_index { |str, indx| indx.zero? ? str : str.split(",").map(&:strip) }
        end.to_h.transform_values { |v| v == ["no other"] ? nil : v }

class Bag
  def initialize(name)
    @name     = name
    @contents = []

    create_contents
  end

  def create_contents
    RULES.fetch(@name)&.each do |bag|
      bag.to_i.times { @contents << Bag.new(bag.split[1..].join(" ")) }
    end
  end

  def quantify_contents
    count_contents.flatten.sum
  end

  protected

  def count_contents
    @contents.any? ? @contents.map { |child| [1, child.count_contents] } : 0
  end
end

# 220149
p Bag.new("shiny gold").quantify_contents
