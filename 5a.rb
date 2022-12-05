require 'debug'

input = <<~INPUT
      [D]
  [N] [C]
  [Z] [M] [P]
   1   2   3

  move 1 from 2 to 1
  move 3 from 1 to 3
  move 2 from 2 to 1
  move 1 from 1 to 2
INPUT

input = File.read('5.input')

stacks, instructions = input.split("\n\n")
stacks  = stacks.lines.map(&:chomp)

columns = (1..stacks.pop[-1].to_i).to_h { |n| [n, []] }
stacks  = stacks.map { |stack| stack.gsub('    ', '.').gsub(/\[|\]/, '').gsub(/\s+/, '').chars }

stacks.each do |stack|
  stack.each.with_index(1) do |crate, i|
    columns[i] << crate if crate.match?(/\w/)
  end
end

instructions = instructions.lines.map { |int| int.scan(/\d+/).map(&:to_i) }

instructions.each do |(quantity, from, to)|
  quantity.times do
    columns[to].unshift(columns[from].shift)
  end
end

puts columns.values.map(&:first).join
