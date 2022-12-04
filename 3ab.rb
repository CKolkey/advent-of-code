def find_common_item(inventory)
  a, b = split_inventory(inventory, inventory.length / 2)
  (a & b).first
end

def split_inventory(inventory, index)
  [
    inventory[...index].chars,
    inventory[index..].chars
  ]
end

def priority(item) = (('a'..'z').to_a + ('A'..'Z').to_a).index(item) + 1

input = File.read('3.input').split

# Part 1
puts(input.sum { priority(find_common_item(_1)) })

# Part 2
puts(input.each_slice(3).sum do |group|
  a, b, c = group.map(&:chars)
  priority((a & b & c).first)
end)
