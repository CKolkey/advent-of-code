require 'debug'

def distance(a, b)
  x1, y1 = a
  x2, y2 = b

  (x1 - x2).abs + (y1 - y2).abs
end

ORIGIN = [100_000, 100_000]

class Wire
  attr_reader :path

  def initialize(steps)
    @steps  = steps
    @path   = []
  end

  def trace!
    @steps.each do |step|
      direction, distance = step.match(/(\w{1})(\d*)/)[1, 2]
      distance = distance.to_i

      x, y = @path.last || ORIGIN

      case direction
      when 'U'
        (y + 1).upto(y + distance) { @path << [x, _1] }
      when 'D'
        (y - 1).downto(y - distance) { @path << [x, _1] }
      when 'R'
        (x + 1).upto(x + distance) { @path << [_1, y] }
      when 'L'
        (x - 1).downto(x - distance) { @path << [_1, y] }
      end
    end

    self
  end

  def position_of(coord)
    path.index(coord) + 1
  end

  def &(other)
    path & other.path
  end
end

def parse(input) = input.split(',')

a, b = File.read('3.input').split

input_a = parse a
input_b = parse b

wire_a = Wire.new(input_a).trace!
wire_b = Wire.new(input_b).trace!

intersections = wire_a & wire_b
intersections.map! { wire_a.position_of(_1) + wire_b.position_of(_1) }

puts intersections.min
