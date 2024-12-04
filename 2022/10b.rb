require "debug"

input = <<~TEST
  addx 1
  noop
  noop
  noop
  addx 5
  addx 5
  noop
  noop
  addx 9
  addx -5
  addx 1
  addx 4
  noop
  noop
  noop
  addx 6
  addx -1
  noop
  addx 5
  addx -2
  addx 7
  noop
  addx 3
  addx -2
  addx -38
  noop
  noop
  addx 32
  addx -22
  noop
  addx 2
  addx 3
  noop
  addx 2
  addx -2
  addx 7
  addx -2
  noop
  addx 3
  addx 2
  addx 5
  addx 2
  addx -5
  addx 10
  noop
  addx 3
  noop
  addx -38
  addx 1
  addx 27
  noop
  addx -20
  noop
  addx 2
  addx 27
  noop
  addx -22
  noop
  noop
  noop
  noop
  addx 3
  addx 5
  addx 2
  addx -11
  addx 16
  addx -2
  addx -17
  addx 24
  noop
  noop
  addx 1
  addx -38
  addx 15
  addx 10
  addx -15
  noop
  addx 2
  addx 26
  noop
  addx -21
  addx 19
  addx -33
  addx 19
  noop
  addx -6
  addx 9
  addx 3
  addx 4
  addx -21
  addx 4
  addx 20
  noop
  addx 3
  addx -38
  addx 28
  addx -21
  addx 9
  addx -8
  addx 2
  addx 5
  addx 2
  addx -9
  addx 14
  addx -2
  addx -5
  addx 12
  addx 3
  addx -2
  addx 2
  addx 7
  noop
  noop
  addx -27
  addx 28
  addx -36
  noop
  addx 1
  addx 5
  addx -1
  noop
  addx 6
  addx -1
  addx 5
  addx 5
  noop
  noop
  addx -2
  addx 20
  addx -10
  addx -3
  addx 1
  addx 3
  addx 2
  addx 4
  addx 3
  noop
  addx -30
  noop
TEST

$buffer = [[], [], [], [], [], []]
$cycle  = 0
$regx   = 1

def do_cycle
  $cycle += 1
  row   = (($cycle - 1) / 40)
  pixel = (($regx..$regx + 2).include?($cycle % 40) ? "#" : " ")
  $buffer[row] << pixel

  yield
end

input.split("\n").each do |instruction|
  instruction, value = instruction.split
  do_cycle {}
  do_cycle { $regx += value.to_i } if value
end

puts $buffer.map(&:join).join("\n")
