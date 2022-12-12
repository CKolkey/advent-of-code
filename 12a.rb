require "debug"
require "set"

input = <<~TEST
  Sabqponm
  abcryxxl
  accszExk
  acctuvwj
  abdefghi
TEST

class Node
  attr_reader :elevation, :edges

  def initialize(elevation)
    @elevation = elevation
    @edges     = {}
  end

  def inspect
    "<Node elevation=#{elevation} edges=#{@edges.keys.zip(@edges.values.map(&:elevation)).to_h}>"
  end

  def add_edge(direction:, node:)
    return unless node
    return unless valid_edge?(node)

    @edges[direction] = node
  end

  private

  def valid_edge?(node)
    node.elevation <= elevation + 1
  end
end

def elevation_to_int(elevation)
  { "S" => 0, "E" => 27, **("a".."z").to_a.zip(1..26).to_h }.fetch(elevation)
end

graph = input.split.map(&:chars).map { |row| row.map { |col| Node.new(elevation_to_int(col)) } }

graph.each_with_index do |row, row_index|
  row.each_with_index do |node, col_index|
    node.add_edge(direction: :up,    node: graph[row_index - 1][col_index]) if graph[row_index - 1]
    node.add_edge(direction: :down,  node: graph[row_index + 1][col_index]) if graph[row_index + 1]
    node.add_edge(direction: :left,  node: row[col_index - 1])
    node.add_edge(direction: :right, node: row[col_index + 1])
  end
end

def shortest_path(start, goal)
  queue    = [[start]]
  complete = []

  until queue.empty?
    path = queue.pop
    path.last.edges.values.each do |node|
      next if path.include?(node)

      if node.elevation == goal
        complete << (path.clone << node)
      else
        queue << (path.clone << node)
      end
    end
  end

  complete.min_by(&:size)
end

puts shortest_path(graph.flatten.find { _1.elevation.zero? }, 27).size
