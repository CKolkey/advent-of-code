# frozen_string_literal: true

require 'debug'
require_relative 'intcode_processor'

class Amplifier
  attr_reader :phase, :input, :processor

  def initialize(phase, program)
    @phase     = phase
    @opcodes   = Opcodes.new({ 4 => opcode4 })
    @processor = IntcodeProcessor.new(program, @opcodes)
  end

  def run!(input)
    @opcodes.overload_fn(3, opcode3(input))
    processor.run!
    self
  end

  def output     = processor.uninitialized? ? 0 : processor.read_last
  def halted?    = processor.halted?
  def suspended? = processor.suspended?

  private

  # The first time the intcode computer runs it asks for two different inputs.
  # All subsequent runs only ask for one input
  #
  # On the first run, the lambda overloads itself with the second version
  def opcode3(input)
    one_input_fn = "->(a) { write!(a, #{input}) and next! }"

    two_inputs_fn = <<~FN
      ->(a) {
          opcodes.overload_fn(3, #{one_input_fn})
          write!(a, #{phase}) and next!
      }
    FN

    eval processor.uninitialized? ? two_inputs_fn : one_input_fn
  end

  def opcode4
    ->(a) { write!(program.size, value(a, 0)) and next! and suspend! }
  end
end

class Circuit
  attr_reader :sequence, :amps

  def initialize(program, sequence)
    @amps     = sequence.map { Amplifier.new(_1, program) }
    @sequence = sequence
  end

  def inspect = "<Circuit :: Sequence: #{sequence}, Signal: #{signal}>"
  def signal  = amps.last.output

  def call = raise NotImplementedError

  private

  def run_until_state(state)
    until amps.all?(&state)
      input = amps.last.output
      amp   = amps.shift.run!(input)
      amps.push(amp)
    end

    self
  end
end

class CircuitV1 < Circuit
  def call = run_until_state(:suspended?)
end

class CircuitV2 < Circuit
  def call = run_until_state(:halted?)
end

program = File.read '7.input'

circuits_v1 = (0..4).to_a.permutation.map { CircuitV1.new(program, _1).call }
print 'Part A: '
pp circuits_v1.max_by(&:signal)

circuits_v2 = (5..9).to_a.permutation.map { CircuitV2.new(program, _1).call }
print 'Part B: '
pp circuits_v2.max_by(&:signal)
pp circuits_v2.max_by(&:signal)
pp circuits_v2.max_by(&:signal)
