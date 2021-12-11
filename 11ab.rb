# frozen_string_literal: true

require "debug"

input = "1553421288\n5255384882\n1224315732\n4258242274\n1658564216\n6872651182\n5775552238\n5622545172\n8766672318\n2178374835"

input = input.split.map { _1.chars.map(&:to_i) }

@map     = {}
@flashes = 0
@ticks   = 0

input.map.with_index do |row, row_index|
  row.map.with_index do |col, col_index|
    @map[[row_index, col_index]] = col
  end
end

def surrounding_points(x, y)
  [-1, -1, 0, 1, 1]
    .permutation(2)
    .uniq
    .map { |delta_x, delta_y| [x + delta_x, y + delta_y] }
end

def tick
  @flashed = []

  @map.transform_values! { _1 + 1 }
  @map.select { _2 > 9 }.each_key(&method(:flash_point))

  @flashed.each { @map[_1] = 0 }
  @ticks += 1
end

def flash_point(coord)
  return if @flashed.include?(coord)

  @flashed << coord
  @flashes += 1

  @map[coord] = 0
  surrounding_points(*coord).each { increment_point(_1) }
end

def increment_point(coord)
  return unless @map[coord]

  @map[coord] += 1
  flash_point(coord) if @map[coord] > 9
end

loop do
  tick

  puts "A: #{@flashes}" if @ticks == 100 # 1679
  break if @map.values.sum.zero?
end

puts "B:  #{@ticks}" # 519
