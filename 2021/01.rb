input = File.read('1.input').split.map(&:to_i)

# A
puts "A: #{input.each_cons(2).select { |a, b| a < b }.count}"

# B
puts "B: #{input.each_cons(4).select { |a, _, _, d| a < d }.count}"
