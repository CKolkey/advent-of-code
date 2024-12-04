require 'debug'

require_relative 'intcode_processor'

def test(input, result: nil, state: nil, opcodes: Opcodes.new)
  process = IntcodeProcessor.new(input, opcodes).run!

  if result
    if process.result == result
      puts 'Good'
    else
      puts "FAILED! Expected: #{expected}, Actual: #{process.result}"
    end
  end

  if state
    if process.program == state
      puts 'Good'
    else
      puts 'FAILED STATE!'
      print 'Expected: '
      p state
      print 'Actual:   '
      p process.program
    end
  end
end

# day 9 tests
# test '104,1125899906842624,99'
# test '1102,34915192,34915192,7,4,7,99,0'

# day 2
# test File.read('2.input'), result: 4_714_701

# day 5
opcode_overload_a = Opcodes.new({ 3 => ->(a) { (puts 'Input > 1' or write! a, 1) and next! } })
test File.read('5.input'), opcodes: opcode_overload_a # input 1 -> all 0's & 6745903

opcode_overload_b = Opcodes.new({ 3 => ->(a) { (puts 'Input > 5' or write! a, 5) and next! } })
test File.read('5.input'), opcodes: opcode_overload_b # input 5 -> 9168267

# # Tests for 1, 2
# test '1,9,10,3,2,3,11,0,99,30,40,50', state: [3500, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50]
# test '1,0,0,0,99', result: 2
# test '2,3,0,3,99', state: [2, 3, 0, 6, 99]
# test '2,4,4,5,99,0', state: [2, 4, 4, 5, 99, 9801]
# test '1,1,1,4,99,5,6,0,99', state: [30, 1, 1, 4, 2, 5, 6, 0, 99]
# test '1002,4,3,4,33', state: [1002, 4, 3, 4, 99]

# # Tests for 3, 4
# test '3,0,4,0,99'      # should output the input
# test '3,0,104,5,99,27' # should output 5

# # Tests for 5, 6
# test '3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9' # outputs 0 if input == 0, 1 if input != 0
# test '3,3,1105,-1,9,1101,0,0,12,4,12,99,1'      # outputs 0 if input == 0, 1 if input != 0
# # Outputs 999 if input < 8, 1000 if input == 8, 1001 if input > 8
# test <<~EOF
#   3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
#   1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
#   999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99
# EOF

# # Tests for 7, 8
# test '3,9,8,9,10,9,4,9,99,-1,8' # output '1' if input == 8
# test '3,3,1108,-1,8,3,4,3,99'   # output '1' if input == 8
# test '3,9,7,9,10,9,4,9,99,-1,8' # output '1' if input < 8
# test '3,3,1107,-1,8,3,4,3,99'   # output '1' if input < 8
