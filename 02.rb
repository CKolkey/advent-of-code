input = File.read('2.input').split("\n")

# A:
p input.group_by { |str| str.split.first }
     .transform_values { |v| v.map { |vv| vv.split.last.to_i }.sum }
     .tap { |h| h["result"] = (h["down"] - h["up"]) * h["forward"] }
     .fetch("result")

# B:
aim   = 0
depth = 0
horz  = 0

input.each do |instruction|
  direction, n = instruction.split
  case direction
  when "up" then aim -= n.to_i
  when "down" then aim += n.to_i
  when "forward" then depth += aim * n.to_i and horz += n.to_i
  end
end

p depth * horz
