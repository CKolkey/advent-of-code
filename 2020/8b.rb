# frozen_string_literal: true

INSTRUCTIONS = File.readlines("8.input").map(&:split).map { |(inst, n)| [inst, n.to_i] }

def run(instructions)
  accumulator = 0
  offset      = 0
  execution   = {}

  loop do
    inst, n = instructions[offset]

    case inst
    when "acc"
      accumulator += n
      offset += 1
    when "jmp"
      offset += n
    when "nop"
      offset += 1
    end

    if offset == instructions.size
      puts accumulator
      break
    end

    break if execution[offset]

    execution[offset] = :run
  end
end

def indexes_for_inst(inst)
  INSTRUCTIONS.each_index.select { |i| INSTRUCTIONS[i][0] == inst }
end

def substitute_inst(index, sub)
  INSTRUCTIONS.dup.tap { |inst| inst[index] = [sub, inst[index][1]] }
end

%w[jmp nop].permutation(2).each do |inst, sub|
  indexes_for_inst(inst).each { |index| run(substitute_inst(index, sub)) }
end
