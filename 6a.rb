require 'debug'

require 'benchmark'

# input = <<~ORBIT
#   COM)B
#   B)C
#   C)D
#   D)E
#   E)F
#   B)G
#   G)H
#   D)I
#   E)J
#   J)K
#   K)L
#   K)YOU
#   I)SAN
# ORBIT

input = File.read('6.input')

input = input.split.map { _1.split ')' }

class Node
  attr_reader :name, :children, :distance, :path

  def initialize(name)
    @name     = name
    @parent   = nil
    @children = []

    @distance = 0
    @path     = []
  end

  def root? = name == 'COM'

  def parent(node)
    @parent = node
    node.add_child self
  end

  def add_child(node)
    @children << node
  end

  def distances!
    @distance = root? ? 0 : (@parent.distance + 1)
    @path = root? ? [] : @parent.path.dup.push(@parent)
    children.each(&:distances!)
  end

  def distance_from(node)
    path.count + node.path.count - (path & node.path).count * 2
  end

  def inspect
    "<Node - name: #{name}, " \
      "distance: #{distance}, " \
      "parent: #{@parent&.name || '-'}, " \
      "path: [#{path.map(&:name).join(', ')}], " \
      "children: [#{children.map(&:name).join(', ')}] >"
  end
end

class Graph
  attr_reader :nodes

  def initialize(input)
    @input = input
    @nodes = {}
  end

  def build_nodes!
    @input.flatten.uniq.each { @nodes[_1] = Node.new(_1) }
  end

  def build_edges!
    @input.each do |(parent, child)|
      nodes[child].parent(nodes[parent])
    end
  end

  def build_distances!
    nodes['COM'].distances!
  end
end

Benchmark.bm do |x|
  graph = Graph.new(input)
  x.report('nodes') { graph.build_nodes! }
  x.report('edges') { graph.build_edges! }
  x.report('dists') { graph.build_distances! }
  x.report('final') { graph.nodes.values.sum(&:distance) }
end
