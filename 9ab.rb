# frozen_string_literal: true

NUMBERS = File.readlines("9").map(&:to_i)

# Part I
WINDOW = 25
NUMBERS.each_index do |i|
  if NUMBERS.slice(i, WINDOW).permutation(2).select { |p| p.sum == NUMBERS[i + WINDOW] }.empty?
    TARGET = NUMBERS[i + WINDOW]
    break
  end
end

puts "Part 1: #{TARGET}"

# Part II
offset = 0
window = 1

loop do
  scope = NUMBERS.slice(offset, window)
  if scope.sum == TARGET
    puts "Part 2: #{scope.min + scope.max}"
    # puts "Still Working: #{scope.min + scope.max == 13826915}!"
    break
  elsif scope.sum > TARGET
    offset += 1
    window  = 1
  else
    window += 1
  end
end

# Oneliners:

# File.readlines("9.input").map(&:to_i).tap { |n| n.each_index { |i| (T = n[i + 25]) && p(T) && break if n.slice(i, 25).permutation(2).select { |p| p.sum == n[i + 25] }.empty? } }.tap { |n| n.size.times.with_object(1) { |c, w| loop { (s = n.slice(c, w)).sum >= T ? (s.sum > T ? break : p(F = s.minmax.sum)) && break : w += 1 } || defined?(F) ? exit : next } }

(n=File.readlines(?9).map(&:to_i)).each_index{|i|(T=n[i+25])&&p(T)&&break if !n.slice(i,25).permutation(2).any?{|p|p.sum==n[i+25]}}||n.size.times.with_object(1){|c,w|loop{(s=n.slice(c,w)).sum>=T ? (s.sum>T ? break: p(F=s.minmax.sum))&&break: w+=1}||defined?(F)?exit: next}

# (n = File.readlines(?9).map(&:to_i)).each_index { |i| ( T = n[i + 25]) && p(T) && break if !n.slice(i, 25).permutation(2).any? { |p| p.sum == n[i + 25] } } || n.size.times.with_object(1) { |c, w| loop { (s = n.slice(c, w)).sum >= T ? (s.sum >T ? break : p(F = s.minmax.sum)) && break : w += 1 } || defined?(F) ? exit : next }

# final answer is 13826915
