require 'debug'

input = <<~INPUT
  $ cd /
  $ ls
  dir a
  14848514 b.txt
  8504156 c.dat
  dir d
  $ cd a
  $ ls
  dir e
  29116 f
  2557 g
  62596 h.lst
  $ cd e
  $ ls
  584 i
  $ cd ..
  $ cd ..
  $ cd d
  $ ls
  4060174 j
  8033020 d.log
  5626152 d.ext
  7214296 k
INPUT

class Filesystem
  def initialize
    @root = Dir.new(name: '/')
    @cwd  = @root
  end

  def inspect
    build_tree(@root)
  end

  def build_tree(node, indent: 0)
    if node.respond_to?(:children)
      [
        ['+' * indent, node.name, node.size].compact.join(' '),
        node.children.map { |child| build_tree(child, indent: indent + 2) }
      ]
    else
      "#{'-' * indent} #{node.name}: \t#{node.size}"
    end
  end

  def cd(name)
    return if name == @cwd.name

    if name == '..'
      @cwd = @cwd.parent
    elsif @cwd.find(name)
      @cwd = @cwd.find(name)
    else
      dir = Dir.new(name:, parent: @cwd)
      @cwd.add(dir)
      @cwd = dir
    end
  end

  def create(size, name)
    @cwd.add(File.new(name:, size:))
  end

  class Dir
    attr_reader :name, :parent, :children

    def initialize(name:, parent: nil, children: [])
      @name     = name
      @parent   = parent
      @children = children
    end

    def size
      children.sum(&:size)
    end

    def find(name)
      @children.find { |child| child.name == name }
    end

    def add(child)
      @children << child
    end
  end

  class File
    attr_reader :name, :size

    def initialize(name:, size:)
      @name = name
      @size = size.to_i
    end
  end
end

filesystem = Filesystem.new

input.split("\n").each do |command|
  case command
  when /^\$ cd/
    filesystem.cd command[5..]
  when /^\d+/
    filesystem.create(*command.split)
  end
end

# filesystem = {}
# cwd = filesystem
#
# input.split("\n").each do |command|
#   case command
#   when /^\$ cd/
#     dir = command[5..]
#     cwd = if cwd[dir]
#             cwd[dir]
#           else
#             cwd[dir] = { '..' => cwd }
#           end
#   when /^\d+/
#     size, name = command.split
#     cwd[name] = size.to_i
#   end
# end

puts filesystem.inspect

debugger
