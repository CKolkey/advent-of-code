# frozen_string_literal: true

# N = Numbers, T = Target, W = Window, p = pair, i = index
N = File.readlines("9.input").map(&:to_i)

# Part I
W = 25
N.each_index { |i| (T = N[i + W]) && break if N.slice(i, W).permutation(2).select { |p| p.sum == N[i + W] }.empty? }
puts "Part 1: #{T}"

# Part II
offset = 0
window = 1

loop do
  scope = N.slice(offset, window)
  if scope.sum == T
    puts "Part 2: #{scope.min + scope.max}"
    # puts "Still Working: #{scope.min + scope.max == 13826915}!"
    break
  elsif scope.sum > T
    offset += 1
    window  = 1
  else
    window += 1
  end
end
