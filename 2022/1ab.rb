input = File.read('1.input').split("\n\n").map { _1.split.sum(&:to_i) }

# Part A
puts input.max

# Part B
puts input.max(3).sum
