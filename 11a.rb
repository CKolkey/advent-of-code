# frozen_string_literal: true

def update(seats)
  seats.dup.tap do |new|
    seats.each do |b, v|
      next if v.nil?

      surrounding = surrounding_coordinates(b.map { |i| i - 1 }, b, b.map { |i| i + 1 })
      surrounding_count = seats.values_at(*surrounding).compact.sum

      if v.zero? && surrounding_count.zero?
        new[b] = 1
      elsif surrounding_count >= 4
        new[b] = 0
      end
    end
  end
end

def surrounding_coordinates(a, b, c)
  [
    [a[0], a[1]], [a[0], b[1]], [a[0], c[1]],
    [b[0], a[1]],               [b[0], c[1]],
    [c[0], a[1]], [c[0], b[1]], [c[0], c[1]]
  ]
end

def make_map(seats)
  seats.each_with_object({}).with_index do |(row, map), indx|
    row.chomp.chars.each_with_index do |seat, i|
      map[[indx, i]] = if seat == "."
                         nil
                       else
                         seat == "L" ? 0 : 1
                       end
    end
  end
end

def count(seats)
  seats.values.compact.sum
end

SEATS = make_map(File.readlines("11.input"))

prev = SEATS
start = Time.now
loop do
  new = update(prev)
  p(count(prev)) and break if count(new) == count(prev)

  prev = new
end

puts Time.now - start
