pairs = File.readlines('4.input').map { eval("[#{_1.gsub('-', '..')}]") }

# Part 1
puts(pairs.count { |(a, b)| a.cover?(b) || b.cover?(a) })

# Part 2
puts(pairs.count { |(a, b)| (a.to_a & b.to_a).any? })
