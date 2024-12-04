# frozen_string_literal: true

require "debug"

class Graph
  attr_reader :nodes

  def initialize(instructions)
    @instructions = instructions.split
    @nodes        = []
  end

  def build!
    @instructions.each do |instruction|
      from, to  = instruction.split("-")
      from_node = find_or_add_node(from)
      to_node   = find_or_add_node(to)

      from_node.add_edge(to_node)
    end

    self
  end

  def starting_node
    find_node("start")
  end

  def find_or_add_node(name)
    find_node(name) || add_node(name)
  end

  def find_node(name)
    @nodes.find { _1.name == name }
  end

  def add_node(name)
    node = Node.new(name)
    @nodes << node

    node
  end
end

class Node
  attr_reader :name, :neighbors

  def initialize(name)
    @name      = name
    @neighbors = []
  end

  def revisitable?
    @name.upcase == @name
  end

  def add_edge(node)
    return if @neighbors.include?(node)

    @neighbors << node
    node.add_edge(self)
  end

  def start?
    @name == "start"
  end

  def end?
    @name == "end"
  end

  def ==(other)
    name == other.name
  end

  def inspect
    "<Node | " \
      "name: '#{name}', #{' ' * (5 - name.length)}" \
      "neighbors: ['#{@neighbors.map(&:name).join('\', \'')}']" \
      ">"
  end
end

class Path
  attr_reader :nodes

  def initialize(graph, map, nodes)
    @graph = graph
    @map   = map
    @nodes = nodes
  end

  def add_step(node)
    @nodes << node
    self
  end

  def build!
    valid_edges.each { |node| dup.add_step(node).build! }
  end

  def steps
    @nodes.map(&:name).join(" -> ")
  end

  def register_path!
    @map.add_path(self)
  end

  def complete?
    @nodes.last.end?
  end

  private

  def valid_edges
    return [] if @nodes.last.end?

    @nodes.last.neighbors.reject(&method(:invalid_step?))
  end

  def invalid_step?(node)
    @nodes.include?(node) && !node.revisitable?
  end

  def dup
    Path.new(@graph, @map, @nodes.dup).register_path!
  end
end

class Map
  def initialize(instructions)
    @instructions = instructions
    @paths = []
  end

  def call
    Path.new(graph, self, [graph.starting_node]).build!

    self
  end

  def add_path(path)
    @paths << path
    path
  end

  def report
    puts "Incomplete:"
    puts(@paths.map(&:steps))
    puts ""
    puts "Complete:"
    puts(complete_paths.map(&:steps))
    puts(complete_paths.count)
  end

  def count
    @paths.count
  end

  def complete_paths
    @paths.select(&:complete?)
  end

  def graph
    @graph ||= Graph.new(@instructions).build!
  end
end

instructions_test_a = "start-A\nstart-b\nA-c\nA-b\nb-d\nA-end\nb-end"
instructions_test_b = "dc-end\nHN-start\nstart-kj\ndc-start\ndc-HN\nLN-dc\nHN-end\nkj-sa\nkj-HN\nkj-dc"
instructions_test_c = "fs-end\nhe-DX\nfs-he\nstart-DX\npj-DX\nend-zg\nzg-sl\nzg-pj\npj-he\nRW-he\nfs-DX\npj-RW\nzg-RW\nstart-pj\nhe-WI\nzg-he\npj-fs\nstart-RW"

puzzle_input_a = "lg-GW\npt-start\npt-uq\nnx-lg\nve-GW\nstart-nx\nGW-start\nGW-nx\npt-SM\nsx-GW\nlg-end\nnx-SM\nlg-SM\npt-nx\nend-ve\nve-SM\nTG-uq\nend-SM\nSM-uq"

puts Map.new(instructions_test_a).call.complete_paths.count == 10
puts Map.new(instructions_test_b).call.complete_paths.count == 19
puts Map.new(instructions_test_c).call.complete_paths.count == 226

puts Map.new(puzzle_input_a).call.complete_paths.count == 3708
