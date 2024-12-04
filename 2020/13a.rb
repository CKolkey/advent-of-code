# frozen_string_literal: true

time, ids = File.readlines("13.input")

time = time.to_i
ids  = ids.split(",").reject { |v| v == "x" }.map(&:to_i).sort

p (((time..Float::INFINITY).lazy.take_while { |n| ids.select { |i| ID = i if (n % i).zero? }.none? }.max + 1) - time) * ID
