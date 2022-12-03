def find_common_item(inventory)
  a, b = split_inventory(inventory)
  (a & b).first
end

def split_inventory(inventory)
  halfway = inventory.length / 2

  [
    inventory[...halfway].chars,
    inventory[halfway..].chars
  ]
end

def priority(item) = [nil, ('a'..'z').to_a, ('A'..'Z').to_a].flatten.index(item)

puts(File.read('3.input').split.sum { priority(find_common_item(_1)) })
