require "awesome_print"
require "debug"
require "set"
require "matrix"

input = <<~TEST
  R 4
  U 4
  L 3
  D 1
  R 4
  D 1
  L 5
  R 2
TEST

# input = File.read("9.input")

def animate(heads, tails, clear: true)
  map = Matrix.build(100, 100) { 0 }
  tails.each { map[*_1] = 1 }

  map[*tails.last] = 3 if tails.any?
  map[*heads.last] = 2

  puts(map.to_a.map do |row|
         row.map do
           if _1 == 2
             "H"
           elsif _1 == 3
             "T"
           elsif _1.zero?
             "."
           else
             "#"
           end
         end.join
       end.reverse[1..].join("\n"))

  # sleep 0.25
  return unless clear

  puts `clear`
end

def diff(a, b)
  [(a[0] - b[0]).abs, (a[1] - b[1]).abs]
end

head = [0, 0]
tail = [0, 0]

tail_positions = []
head_positions = []

input.lines.map(&:split).each do |(direction, value)|
  value.to_i.times do
    head_positions << head.dup
    tail_positions << tail.dup

    # animate(head_positions, tail_positions)

    case direction
    when "R" then head[1] += 1
    when "L" then head[1] -= 1
    when "U" then head[0] += 1
    when "D" then head[0] -= 1
    end

    next unless diff(head, tail).max > 1

    tail = head_positions.last
  end
end

# animate(head_positions, tail_positions, clear: false)
puts tail_positions.uniq.count
