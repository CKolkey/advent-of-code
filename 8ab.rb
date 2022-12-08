require "debug"
require "matrix"

input = <<~TEST
  30373
  25512
  65332
  33549
  35390
TEST

input = File.read("8.input")

def display_matrix(matrix)
  puts matrix.to_a.map { _1.join.gsub("1", "+").gsub("0", " ") }.join("\n"), "\n"
end
alias dm display_matrix

def find_visible(matrix)
  visibility = Matrix.build(matrix.row_vectors.count) { 1 }

  matrix.row_vectors[1..-2].each.with_index(1) do |row, index|
    max = -1
    row.each_with_index do |n, i|
      if max >= n
        visibility[index, i] = 0
      else
        max = n
      end
    end
  end

  visibility
end

trees = Matrix[*input.split.map { _1.chars.map(&:to_i) }]
view  = Matrix.zero(trees.row_vectors.count)

4.times do
  view  = view.combine(find_visible(trees)) { |a, b| a.zero? && b.zero? ? 0 : 1 }
              .rotate_entries(1)

  trees = trees.rotate_entries(1)
end

puts view.to_a.flatten.count(1)
