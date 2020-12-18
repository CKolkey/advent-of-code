# frozen_string_literal: true

require "pry-byebug"

START_INPUT, SCHEDULE = File.read("13.input").match(/(\d*)\s(.*)/).captures
START = START_INPUT.to_i
BUS_IDS = SCHEDULE.split(",").reject { |v| v == "x" }.map(&:to_i).sort

p (((START..Float::INFINITY).lazy.take_while { |n| BUS_IDS.select { |i| ID = i if (n % i).zero? }.none? }.max + 1) - START) * ID
