require "debug"

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

input = File.read("7.input")

cwd = filesystem = {}
filesystem["/"] = { ".." => filesystem }

input.split("\n").each do |command|
  case command
  when /^dir/
    cwd[command[4..]] = { ".." => cwd }
  when /^\$ cd/
    cwd = cwd[command[5..]]
  when /^\d+/
    size, name = command.split
    cwd[name]  = size.to_i
  end
end

def sum_tree(tree)
  tree.except("..")
      .values
      .sum { |node| node.is_a?(Hash) ? sum_tree(node) : node }
end

def process_tree(tree)
  tree.transform_values do |node|
    next unless node.is_a? Hash

    node[:size] = sum_tree(node)
    process_tree(node.except(".."))
  end
end

def collect_dirs(tree, collector = {})
  tree.except("..").each_key do |name|
    next unless tree[name].is_a?(Hash)

    collector[name] = tree[name][:size]
    collect_dirs(tree[name], collector)
  end

  collector
end

# puts sum_tree(filesystem.dig("/")) == 48_381_165
# puts sum_tree(filesystem.dig("/", "a")) == 94_853
# puts sum_tree(filesystem.dig("/", "a", "e")) == 584
# puts sum_tree(filesystem.dig("/", "d")) == 24_933_642

process_tree(filesystem)

# puts filesystem.dig("/", :size) == 48_381_165
# puts filesystem.dig("/", "a", :size) == 94_853
# puts filesystem.dig("/", "a", "e", :size) == 584
# puts filesystem.dig("/", "d", :size) == 24_933_642

dirs = collect_dirs(filesystem)

# puts dirs == { "/" => 48_381_165, "a" => 94_853, "e" => 584, "d" => 24_933_642 }
# puts dirs.select { |_, v| v <= 100_000 }.values.sum == 95_437
puts dirs.select { |_, v| v <= 100_000 }.values.sum

debugger
