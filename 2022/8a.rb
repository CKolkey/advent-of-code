require "matrix"

def find_visible(matrix)
  visibility = Matrix.build(matrix.row_vectors.count) { 1 }

  matrix.row_vectors[1..-2].each.with_index(1) do |row, index|
    max = row.first
    row[1..].each.with_index(1) do |n, i|
      visibility[index, i] = 0 if n <= max
      max = n                  if n > max
    end
  end

  visibility
end

input = File.read("8.input").split.map { _1.chars.map(&:to_i) }
grid  = Matrix[*input]
view  = Matrix.zero(input.count)

4.times do
  grid = grid.rotate_entries(1)
  view = view.rotate_entries(1).combine(find_visible(grid)) { [_1, _2].sum.zero? ? 0 : 1 }
end

puts view.to_a.flatten.count(1)
