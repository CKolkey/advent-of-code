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

  def add_edge(node)
    @parent = node
    node.add_child self
  end

  def add_child(node)
    @children << node
  end

  def distances!
    @distance = root? ? 0  : (@parent.distance + 1)
    @path     = root? ? [] : @parent.path.dup.push(@parent)

    children.each(&:distances!)
  end

  def distance_from(node)
    path.count + node.path.count - (path & node.path).count * 2
  end
end

class Tree
  attr_reader :nodes

  def initialize(input)
    @input = input
    @nodes = {}
  end

  def build!
    @input.each do |(parent_name, child_name)|
      parent = nodes[parent_name] ||= Node.new(parent_name)
      child  = nodes[child_name]  ||= Node.new(child_name)

      child.add_edge(parent)
    end
  end

  def distances!
    nodes['COM'].distances!
  end
end

Benchmark.bm do |x|
  tree = Tree.new(input)
  x.report('build') { tree.build! }
  x.report('dists') { tree.distances! }

  you   = tree.nodes['YOU']
  santa = tree.nodes['SAN']

  x.report('final') { puts you.distance_from(santa) }
end
