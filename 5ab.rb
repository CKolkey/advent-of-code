class CraneMover
  attr_reader :stacks, :instructions

  def initialize(stacks, instructions)
    @stacks       = build_stacks stacks
    @instructions = parse_instructions instructions
  end

  def operate!
    instructions.each { perform_instruction!(*_1) }
    self
  end

  def results
    stacks.values.map(&:first).join
  end

  private

  def parse_instructions(instructions)
    instructions.lines.map { _1.scan(/\d+/) }
  end

  def build_stacks(stacks)
    stacks.lines
          .map { _1.scan(/\w|\s{4}/) }
          .transpose
          .map { _1.grep(/\w/) }
          .to_h { [_1.pop, _1] }
  end
end

class CraneMover9000 < CraneMover
  def perform_instruction!(quantity, from, to)
    quantity.to_i.times { stacks[to].unshift(stacks[from].shift) }
  end
end

class CraneMover9001 < CraneMover
  def perform_instruction!(quantity, from, to)
    stacks[to].unshift(*stacks[from].shift(quantity.to_i))
  end
end

input = File.read("5.input").split("\n\n")
puts [CraneMover9000.new(*input), CraneMover9001.new(*input)].map { _1.operate!.results }

# "SPFMVDTZT"
# "ZFSJBPRFP"
