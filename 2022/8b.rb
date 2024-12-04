require "matrix"

def visibility(point:, col:, row:, row_index:, col_index:)
  north = col[...row_index].reverse
  east  = row[(col_index + 1)..]
  south = col[(row_index + 1)..]
  west  = row[...col_index].reverse

  visible = [north, east, south, west]
  visible.map! do |points|
    total = 0
    until points.empty?
      total += 1

      break unless point > points.shift
    end
    total
  end

  visible.reduce(:*)
end

input = File.read("8.input").split.map { _1.chars.map(&:to_i) }

grid = {
  rows: input.map.with_index { |row, i| [i, row] }.to_h,
  cols: input.transpose.map.with_index { |row, i| [i, row] }.to_h
}

view = Matrix.zero(input.count)

input.count.times do |col_index|
  input.count.times do |row_index|
    view[row_index, col_index] = visibility(
      point: grid[:cols][col_index][row_index],
      col: grid[:cols][col_index],
      row: grid[:rows][row_index],
      row_index:,
      col_index:
    )
  end
end

puts view.to_a.flatten.max == 291_840
