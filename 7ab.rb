# frozen_string_literal: true

require 'debug'
require_relative 'intcode_processor'

class Amplifier
  attr_reader :phase, :input, :processor

  def initialize(phase, program)
    @phase     = phase
    @processor = IntcodeProcessor.new(program, opcodes)
    @two_input = true
  end

  def run!(input)
    opcodes.overload_fn(3, opcode3(input))
    processor.run!
    self
  end

  def output
    processor.uninitialized? ? 0 : processor.read_last
  end

  def halted? = processor.halted?

  def suspended? = processor.suspended?

  private

  def opcodes
    @opcodes ||= Opcodes.new({ 4 => opcode4 })
  end

  # The first time the intcode computer runs it asks for two inputs.
  # All subsequent runs only ask for one input
  #
  # On the first run, the lambda overloads itself with the second version
  def opcode3(input)
    function = if @two_input
                 <<~FN
                   ->(a) {
                       opcodes.overload_fn(3, ->(a) { write!(a, #{input}) and next! })
                       write!(a, #{phase}) and next!
                   }
                 FN
               else
                 "->(a) { write!(a, #{input}) and next! }"
               end

    @two_input = false

    eval function
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

  def call(state = nil)
    raise 'No State Provided' unless state

    until amps.all?(&state)
      input = amps.last.output
      amp   = amps.shift.run!(input)
      amps.push(amp)
    end

    self
  end
end

class CircuitV1 < Circuit
  def call = super(:suspended?)
end

class CircuitV2 < Circuit
  def call = super(:halted?)
end

program = File.read '7.input'

circuits_v1 = (0..4).to_a.permutation.map { CircuitV1.new(program, _1).call }
print 'Part A: '
pp circuits_v1.max_by(&:signal)

circuits_v2 = (5..9).to_a.permutation.map { CircuitV2.new(program, _1).call }
print 'Part B: '
pp circuits_v2.max_by(&:signal)
