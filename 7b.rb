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

# program = File.read '7.input'

circuits = (0..4).to_a.permutation.map { Circuit.new(program, _1).call }

puts ''
puts 'Winner:'
pp circuits.max_by(&:signal)
