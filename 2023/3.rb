require "debug"

input = <<~INPUT
  467..114..
  ...*......
  ..35..633.
  ......#...
  617*......
  .....+.58.
  ..592.....
  ......755.
  ...$.*....
  .664.598..
INPUT

marks  = []
parsed = input.gsub(/[\d.]/, " ")
              .split("\n")
              .map { _1.split("").map { |c| c == " " ? 0 : 1 } }
              .each { |row| row.each_with_index { |c, i| marks << i if c.positive? } }

marks = marks.uniq.sort
debugger(pre: "info")
