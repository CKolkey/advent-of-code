require 'debug'

WIDTH  = 25
HEIGHT = 6

class Array
  def group(size)
    [].tap { _1 << shift(size) until empty? }
  end
end

def print_line = puts(Array.new(WIDTH + 1, '#').join(' '))

map   = Hash.new { [] }
image = Array.new(HEIGHT) { [] }
input = File.read('8.input')
            .strip
            .chars
            .map { _1 == '2' ? nil : _1.to_i }
            .group(WIDTH * HEIGHT)
            .map { _1.group(WIDTH) }

input.each do |layer|
  HEIGHT.times do |row|
    WIDTH.times do |col|
      map[[row, col]] = map[[row, col]] << layer[row][col]
    end
  end
end

map.transform_values { _1.compact.first }
   .each { |(r, c), v| image[r][c] = v }

print_line
puts image.map { |row| "# #{row.map { _1.zero? ? '#' : ' ' }.join(' ')}" }.join("\n")
print_line
