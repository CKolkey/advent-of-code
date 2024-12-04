# frozen_string_literal: true

def make_schedule(string)
  string.split(",").map(&:to_i).map.with_index { |n, i| [i, n] unless n.zero? }.compact
end

def find_earliest_time(schedule)
  start = 1
  step  = 1

  schedule.each do |(index, id)|
    start = find_next_start(start, step, index, id)
    step *= id
  end

  start
end

def find_next_start(start, step, index, id)
  (start..Float::INFINITY).step(step).lazy.take_while { |n| !((n - step + index) % id).zero? }.force.last.to_i
end

puts find_earliest_time(make_schedule(File.readlines("13.input")[1]))
# puts find_earliest_time(make_schedule("17,x,13,19")) == 3417
# puts find_earliest_time(make_schedule("7,13,x,x,59,x,31,19")) == 1068781
# puts find_earliest_time(make_schedule("67,7,59,61")) == 754018
# puts find_earliest_time(make_schedule("67,x,7,59,61")) == 779210
# puts find_earliest_time(make_schedule("67,7,x,59,61")) == 1261476
# puts find_earliest_time(make_schedule("1789,37,47,1889")) == 1202161486
