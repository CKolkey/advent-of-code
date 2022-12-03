def priority(item) = [nil, ('a'..'z').to_a, ('A'..'Z').to_a].flatten.index(item)

badges = File.read('3.input').split.each_slice(3).map do |group|
  a, b, c = group.map(&:chars)
  badge = (a & b & c).first
  priority(badge)
end

puts badges.sum
