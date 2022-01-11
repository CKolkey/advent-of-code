# frozen_string_literal: true

require 'debug'
require_relative 'intcode_processor'

class Amplifier
  attr_reader :phase, :input, :processor

  def initialize(phase, input, program)
    @phase     = phase
    @input     = input
    @processor = IntcodeProcessor.new(program, opcodes)
  end

  def run!
    processor.run!
    self
  end

  def inspect
    "<Amp #{phase}>"
  end

  def opcodes
    Opcodes.new({ 3 => opcode3, 4 => opcode4 })
  end

  def output
    processor.result
  end

  def opcode3
    eval <<~FN
      ->(a) {
        if pointer.zero?
          puts('Input > #{phase}')
          write!(a, #{phase})
        else
          puts('Input > #{input}')
          write!(a, #{input})
        end

        next!
      }
    FN
  end

  def opcode4
    ->(a) { write!(0, value(a, 0)) and next! }
  end
end

class Circuit
  attr_reader :program, :sequence, :amps

  def initialize(program, sequence)
    @program  = program
    @sequence = sequence
    @amps     = []
  end

  def inspect
    "Sequence: #{sequence}, Signal: #{signal}"
  end

  def call
    sequence.each do |phase|
      input = amps.last&.output || 0
      @amps << Amplifier.new(phase, input, program).run!
    end

    self
  end

  def signal
    @amps.last.output
  end
end

# program = '3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0'
# program = '3,23,3,24,1002,24,10,24,1002,23,-1,23,101,5,23,23,1,24,23,23,4,23,99,0,0'
# program = '3,31,3,32,1002,32,10,32,1001,31,-2,31,1007,31,0,33,1002,33,7,33,1,33,31,31,1,32,31,31,4,31,99,0,0,0'
program = File.read '7.input'

circuits = (0..4).to_a.permutation.map { Circuit.new(program, _1).call }

puts ''
puts 'Winner:'
pp circuits.max_by(&:signal)
