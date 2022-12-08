require "matrix"

def visibility(grid, row_index:, col_index:)
  north = grid.column_vectors[col_index][...row_index].reverse
  east  = grid.row_vectors[row_index][(col_index + 1)..]
  south = grid.column_vectors[col_index][(row_index + 1)..]
  west  = grid.row_vectors[row_index][...col_index].reverse

  visible = [north, east, south, west]
  visible.map! do |points|
    total = 0
    until points.empty?
      total += 1

      break unless grid[row_index, col_index] > points.shift
    end
    total
  end

  visible.reduce(:*)
end

input = File.read("8.input").split.map { _1.chars.map(&:to_i) }
grid  = Matrix[*input]
view  = Matrix.zero(input.count)

input.count.times do |row_index|
  input.count.times do |col_index|
    view[row_index, col_index] = visibility(grid, row_index:, col_index:)
  end
end

puts view.to_a.flatten.max == 291_840
