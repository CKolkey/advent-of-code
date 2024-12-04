require 'debug'

class Slope
  def initialize(point_a, point_b)
    @point_a = point_a
    @point_b = point_b
  end

  def dx = @point_a.x - @point_b.x

  def dy = @point_a.y - @point_b.y

  def value
    if slope_value.is_a? Rational
      y, x = slope_value.abs.to_s.split('/').map(&:to_i)

      [
        dy.negative? ? y * -1 : y,
        dx.negative? ? x * -1 : x
      ]
    else
      slope_value
    end
  end

  private

  def slope_value
    if dx.zero?
      dy.positive? ? :N : :S
    elsif dy.zero?
      dx.positive? ? :W : :E
    else
      Rational(dy, dx)
    end
  end
end

class Point
  attr_reader :x, :y, :visible

  def initialize(y, x)
    @y = y
    @x = x
    @visibile = {}
  end

  def slope(point)
    return if point == self

    Slope.new(self, point).value
  end
end

class Grid
  attr_reader :points

  def initialize(map)
    @map    = map
    @points = []
    @visibility = {}
  end

  def compute_visibilities!
    points.each do |point|
      slopes = points.map { point.slope(_1) }
      @visibility[point] = slopes.compact.uniq.count
    end
  end

  def best
    @visibility.max_by { _2 }
  end

  def build!
    @map.split.each_with_index do |row, row_i|
      row.chars.each_with_index do |col, col_i|
        @points << Point.new(row_i, col_i) if col == '#'
      end
    end

    self
  end
end

map = <<~MAP
  #..#....#...#.#..#.......##.#.####
  #......#..#.#..####.....#..#...##.
  .##.......#..#.#....#.#..#.#....#.
  ###..#.....###.#....##.....#...#..
  ...#.##..#.###.......#....#....###
  .####...##...........##..#..#.##..
  ..#...#.#.#.###....#.#...##.....#.
  ......#.....#..#...##.#..##.#..###
  ...###.#....#..##.#.#.#....#...###
  ..#.###.####..###.#.##..#.##.###..
  ...##...#.#..##.#............##.##
  ....#.##.##.##..#......##.........
  .#..#.#..#.##......##...#.#.#...##
  .##.....#.#.##...#.#.#...#..###...
  #.#.#..##......#...#...#.......#..
  #.......#..#####.###.#..#..#.#.#..
  .#......##......##...#..#..#..###.
  #.#...#..#....##.#....#.##.#....#.
  ....#..#....##..#...##..#..#.#.##.
  #.#.#.#.##.#.#..###.......#....###
  ...#.#..##....###.####.#..#.#..#..
  #....##..#...##.#.#.........##.#..
  .#....#.#...#.#.........#..#......
  ...#..###...#...#.#.#...#.#..##.##
  .####.##.#..#.#.#.#...#.##......#.
  .##....##..#.#.#.......#.....####.
  #.##.##....#...#..#.#..###..#.###.
  ...###.#..#.....#.#.#.#....#....#.
  ......#...#.........##....#....##.
  .....#.....#..#.##.#.###.#..##....
  .#.....#.#.....#####.....##..#....
  .####.##...#.......####..#....##..
  .#.#.......#......#.##..##.#.#..##
  ......##.....##...##.##...##......
MAP

grid = Grid.new(map).build!
grid.compute_visibilities!
p grid.best

binding.b
