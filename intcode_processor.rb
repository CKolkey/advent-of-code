# frozen_string_literal: true

require 'debug'
# Set of opcodes for IntcodeProcessor. Functions can be overloaded via hash provided to constructor
#  1: Addition: Write sum of a + b to address c
#  2: Multiplication: Write product of a * b to address c
#  3: Get and write user input to address a
#  4: Print value to STDOUT
#  5: Jump if true (non-zero)
#  6: Jump if false (zero)
#  7: Write 1 or 0 (true/false) to address c comparing if a < b
#  8: Write 1 or 0 (true/false) to address c comparing if a == b
#  9: Adjust @offset value
# 99: Halt
class Opcodes
  DEFAULTS = {
    1 => ->(a, b, c) { write!(address(c, 2), value(a, 0) + value(b, 1)) and next! },
    2 => ->(a, b, c) { write!(address(c, 2), value(a, 0) * value(b, 1)) and next! },
    3 => ->(a)       { print('Input > ') or write!(address(a, 0), gets.chomp.to_i) and next! },
    4 => ->(a)       { puts("Output: #{value(a, 0)}") or next! },
    5 => ->(a, b)    { !value(a, 0).zero? ? jump!(value(b, 1)) : next! },
    6 => ->(a, b)    { value(a, 0).zero? ? jump!(value(b, 1)) : next! },
    7 => ->(a, b, c) { write!(address(c, 2), (value(a, 0) < value(b, 1) ? 1 : 0)) and next! },
    8 => ->(a, b, c) { write!(address(c, 2), (value(a, 0) == value(b, 1) ? 1 : 0)) and next! },
    9 => ->(a)       { adjust_offset!(value(a, 0)) and next! },
    99 => ->         { halt! }
  }.freeze

  def initialize(overloads = {})
    @opcodes = DEFAULTS.merge(overloads)
  end

  def overload_fn(opcode, func)
    @opcodes[opcode] = func
  end

  def fn(opcode)
    @opcodes[opcode]
  end
end

class IntcodeProcessor
  attr_reader :program, :pointer, :opcodes

  def initialize(program, opcodes = Opcodes.new)
    @program = program.split(',').map(&:to_i)
    @opcodes = opcodes
    @state   = :uninitialized
    @pointer = 0
    @offset  = 0
    @cycles  = 0
  end

  def run!
    @state = :running

    until halted? || suspended?
      @function = opcodes.fn(opcode)
      @params   = read((pointer + 1)..(pointer + @function.arity))

      instance_exec(*@params, &@function)
      @cycles += 1
    end

    puts "(#{@cycles} cycles)"
    self
  end

  def result = read(0)

  def read_last = read(-1)

  def halted? = @state == :halted

  def suspended? = @state == :suspended

  def running? = @state == :running

  def uninitialized? = @state == :uninitialized

  private

  def opcode
    instruction.digits[..1].reverse.join.to_i
  end

  def address(param, position)
    case p_mode(position)
    in 0..1 # Absolute Mode
      param
    in 2    # Relative Mode
      param + @offset
    end
  end

  def value(param, position)
    case p_mode(position)
    when 0 # Position Mode
      read(param)
    when 1 # Immediate Mode
      param
    when 2 # Relative Mode
      read(param + @offset)
    end
  end

  def p_mode(position)
    (instruction.digits[2..] || []).slice(position) || 0
  end

  def instruction
    read pointer
  end

  def halt! = @state = :halted

  def suspend! = @state = :suspended

  def read(...)
    @program.slice(...) || 0
  end

  def write!(address, value)
    @program.fill(0, (@program.size..address)) if address > @program.size
    @program[address] = value
  end

  def next!
    jump!(@pointer + @params.size + 1)
  end

  def jump!(address)
    @pointer = address
  end

  def adjust_offset!(value)
    @offset += value
  end
end

if ARGV.delete('--test')
  def test(input, result: nil, state: nil, opcodes: Opcodes.new)
    process = IntcodeProcessor.new(input, opcodes).run!

    if result
      if process.result == result
        puts 'Good'
      else
        puts "FAILED! Expected: #{result}, Actual: #{process.result}"
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

    puts ''
  end

  opcode_overload_a = Opcodes.new({ 3 => ->(a) { puts('Input > 1') or write!(a, 1) and next! } })
  test File.read('5.input'), opcodes: opcode_overload_a

  opcode_overload_b = Opcodes.new({ 3 => ->(a) { puts('Input > 5') or write!(a, 5) and next! } })
  test File.read('5.input'), opcodes: opcode_overload_b

  # # Passing
  test '109, 1, 3, 3, 204, 2, 99'
  test '109, -1, 204, 1, 99', result: 109
  test '109, -1, 4, 1, 99', result: -1
  test '109, -1, 104, 1, 99', result: 1
  test '109, 1, 9, 2, 204, -6, 99', result: 204
  test '109, 1, 109, 9, 204, -6, 99', result: 204
  test '109, 1, 209, -1, 204, -106, 99', result: 204

  test '109, 1, 203, 2, 204, 2, 99'
end
