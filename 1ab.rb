input = File.read('1.input').split("\n\n").map { _1.split.map(&:to_i).sum }

# Part A
puts input.max

# Part B
puts input.max(3).sum
