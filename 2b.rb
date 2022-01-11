require 'debug'

PROGRAM = [
  1, 0, 0, 3, 1, 1, 2, 3, 1, 3, 4, 3, 1, 5, 0, 3, 2, 13, 1, 19, 1, 5, 19, 23,
  2, 10, 23, 27, 1, 27, 5, 31, 2, 9, 31, 35, 1, 35, 5, 39, 2, 6, 39, 43, 1, 43,
  5, 47, 2, 47, 10, 51, 2, 51, 6, 55, 1, 5, 55, 59, 2, 10, 59, 63, 1, 63, 6,
  67, 2, 67, 6, 71, 1, 71, 5, 75, 1, 13, 75, 79, 1, 6, 79, 83, 2, 83, 13, 87,
  1, 87, 6, 91, 1, 10, 91, 95, 1, 95, 9, 99, 2, 99, 13, 103, 1, 103, 6, 107, 2,
  107, 6, 111, 1, 111, 2, 115, 1, 115, 13, 0, 99, 2, 0, 14, 0
]

(0..99).map do |a|
  (0..99).map do |b|
    memory    = PROGRAM.clone
    memory[1] = a
    memory[2] = b

    pointer = 0

    loop do
      instruction, value_a_address, value_b_address, address = memory[pointer..(pointer + 3)]

      value_a = memory[value_a_address]
      value_b = memory[value_b_address]

      case instruction
      when 1
        memory[address] = value_a + value_b
      when 2
        memory[address] = value_a * value_b
      when 99
        break
      end

      pointer += 4
    end

    puts "#{a}#{b}" if memory[0] == 19_690_720
  end
end
