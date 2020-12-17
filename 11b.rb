# frozen_string_literal: true

VECTORS = [[-1, 0], [-1, 1], [-1, -1], [0, -1], [0, 1], [1, 0], [1, 1], [1, -1]].freeze

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

def update(seats)
  seats.dup.tap do |new|
    seats.each do |b, v|
      next if v.nil?

      surrounding_count = count_all_vectors(seats, b)
      if v.zero? && surrounding_count.zero?
        new[b] = 1
      elsif surrounding_count >= 5
        new[b] = 0
      end
    end
  end
end

def count_all_vectors(seats, seat)
  VECTORS.sum { |vector| count_vector(seats, seat, *vector) }
end

def count_vector(seats, seat, x_diff, y_diff)
  (1..Float::INFINITY).lazy.each do |n|
    case seats.fetch(travel_vector(seat, x_diff, y_diff, n), :end)
    when :end, 0
      break 0
    when 1
      break 1
    end
  end
end

def travel_vector(seat, x_increment, y_increment, multiplier)
  [
    seat[0] + x_increment * multiplier,
    seat[1] + y_increment * multiplier
  ]
end

def count(seats)
  seats.values.compact.sum
end

prev = make_map(File.readlines("11.input"))
loop do
  new = update(prev)
  p count(new)
  p(count(prev)) and break if count(new) == count(prev)

  prev = new
end

# 2234
