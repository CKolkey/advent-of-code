def sum_tree(tree)
  tree.except('..')
      .values
      .sum { |node| node.is_a?(Hash) ? sum_tree(node) : node }
end

def compute_tree_size!(tree)
  tree.transform_values do |node|
    next unless node.is_a? Hash

    node[:size] = sum_tree(node)
    compute_tree_size!(node.except('..'))
  end
end

def collect_dirs(tree, collector = [])
  tree.except('..').each_key do |name|
    next unless tree[name].is_a?(Hash)

    collector.push(tree[name][:size])
    collect_dirs(tree[name], collector)
  end

  collector
end

cwd = filesystem = {}
filesystem['/'] = { '..' => filesystem }

File.read('7.input').split("\n").each do |command|
  case command
  when /^dir/
    cwd[command[4..]] = { '..' => cwd }
  when /^\$ cd/
    cwd = cwd[command[5..]]
  when /^\d+/
    size, name = command.split
    cwd[name]  = size.to_i
  end
end

compute_tree_size!(filesystem)
dirs = collect_dirs(filesystem)

# Part 1
puts dirs.select { _1 <= 100_000 }.sum # == 1_783_610

# Part 2
TOTAL    = 70_000_000
MIN_FREE = 30_000_000
FREE     = TOTAL - dirs[0]
puts dirs.select { FREE + _1 > MIN_FREE }.min # == 4_370_655
