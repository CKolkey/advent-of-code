require 'debug'

class Slope
  def initialize(point_a, point_b)
    @point_a = point_a
    @point_b = point_b
  end

  def dx    = @point_b.x - @point_a.x
  def dy    = @point_b.y - @point_a.y
  def angle = ((Math.atan2(dy, dx) * 180 / Math::PI) + 90).round(1) % 360
end

class Point
  attr_reader :x, :y, :origin

  def initialize(x, y, origin = false)
    @x = x
    @y = y
    @state = true
    @origin = origin
  end

  def inspect = "<(#{x}, #{y}) - #{on? ? 'ON' : 'OFF'}>"

  def on?
    @state
  end

  def off?
    !@state
  end

  def off!
    @state = false
  end

  def distance_to(point)
    (x - point.x).abs + (y - point.y).abs
  end
end

class Grid
  attr_reader :points, :rows, :cols

  def initialize(map, origin)
    @map    = map.split.map(&:chars)
    @origin = origin
    @points = []
    @visibility = Hash.new { [] }
  end

  def compute_visibilities!
    points.each do |point|
      @visibility[Slope.new(origin_point, point).angle] += [point]
    end
  end

  def print_map
    puts @map.map(&:join).join("\n")
    puts ''
  end

  def loop!
    @counter = 0
    @map[origin_point.y][origin_point.x] = 'X'

    (0..360).step(0.1).to_a.map { _1.round(1) }.cycle do |angle|
      next if @visibility[angle].select(&:on?).none?

      target = @visibility[angle]
               .select(&:on?)
               .min_by { origin_point.distance_to(_1) }

      target.off!
      @counter += 1

      p target
      p @counter

      @map[target.y][target.x] = points.count(&:off?)
      print_map

      break if @visibility.values.flatten.all?(&:off?) || @counter > 200
    end
  end

  def origin_point
    @origin_point ||= points.find(&:origin)
  end

  def build!
    @map.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        next unless col == '#'

        @points << Point.new(col_i, row_i, [col_i, row_i] == @origin)
      end
    end

    self
  end

  private

  def angles
    @angles ||= (0..360).step(0.1).to_a.map { _1.round(1) }
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

grid = Grid.new(map, [23, 20]).build!
grid.compute_visibilities!
grid.loop!

binding.b
