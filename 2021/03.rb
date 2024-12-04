input = File.readlines("3.input").map(&:chars)

# A:

gamma = input.transpose
             .map(&:tally)
             .map { |bit| bit.max_by { _2 }.first }
             .join
             .to_i(2)

epsilon = gamma ^ 0xfff

p gamma * epsilon == 2003336

# B:
most_choices = input.dup
index = 0

def most_common_bit_for_position(choices, index)
  tally = choices.map { |n| n[index] }.tally
  tally["0"] > tally["1"] ? "0" : "1"
end

while most_choices.count > 1 do
  common = most_common_bit_for_position(most_choices, index)
  most_choices.select! { |choice| choice[index] == common }
  index += 1
end

most = most_choices.flatten.join.chomp.to_i(2)


least_choices = input.dup
index = 0

def least_common_bit_for_position(choices, index)
  tally = choices.map { |n| n[index] }.tally
  tally["1"] < tally["0"] ? "1" : "0"
end

while least_choices.count > 1 do
  common = least_common_bit_for_position(least_choices, index)
  least_choices.select! { |choice| choice[index] == common }
  index += 1
end

least = least_choices.flatten.join.chomp.to_i(2)

p most * least == 1877139
