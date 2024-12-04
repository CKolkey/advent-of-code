require 'debug'
require 'set'

test = <<~TEST
  <x=-1, y=0, z=2>
  <x=2, y=-10, z=-7>
  <x=4, y=-8, z=8>
  <x=3, y=5, z=-1>
TEST

test2 = <<~TEST2
  <x=-8, y=-10, z=0>
  <x=5, y=5, z=10>
  <x=2, y=-7, z=3>
  <x=9, y=-8, z=-3>
TEST2

input = <<~INPUT
  <x=17, y=-9, z=4>
  <x=2, y=2, z=-13>
  <x=-1, y=5, z=-1>
  <x=4, y=7, z=-7>
INPUT

class Array
  def lcm
    reduce(:lcm)
  end
end

EREclass Planet
  attr_reader :x_pos, :y_pos, :z_pos, :cycles

  def initialize(name, x_pos, y_pos, z_pos)
    @name = name

    @x_pos = x_pos
    @y_pos = y_pos
    @z_pos = z_pos

    @x_velocity = 0
    @y_velocity = 0
    @z_velocity = 0

    @x_states = Set.new
    @y_states = Set.new
    @z_states = Set.new
  end

  def inspect
    "<#{@name}: #{lcm}>"
  end

  def lcm = [@x_states.count, @y_states.count, @z_states.count].lcm

  def finished?
    @x_states.include?(state(:x)) && @y_states.include?(state(:y)) && @z_states.include?(state(:z))
  end

  def tick!
    @x_states << state(:x)
    @y_states << state(:y)
    @z_states << state(:z)

    @x_pos += @x_velocity
    @y_pos += @y_velocity
    @z_pos += @z_velocity
  end

  def state(axis)
    { x: [@x_pos, @x_velocity], y: [@y_pos, @y_velocity], z: [@z_pos, @z_velocity] }[axis]
  end

  def change_velocity(axis, delta)
    case axis
    when :x then @x_velocity += delta
    when :y then @y_velocity += delta
    when :z then @z_velocity += delta
    end
  end
end

class System
  attr_reader :planets

  def initialize(input)
    @planets = parse(input).map.with_index { Planet.new(%w[A B C D][_2], *_1) }
  end

  def tick!
    planets.combination(2).map { apply_gravity(*_1) }
    planets.map(&:tick!)
  end

  def lcm
    planets.map(&:lcm).reduce(:lcm)
  end

  private

  def parse(input)
    input.split("\n").map { _1.scan /<x=(.*), y=(.*), z=(.*)>/ }.flatten(1).map { _1.map(&:to_i) }
  end
end

def apply_gravity(planet_a, planet_b)
  %i[x y z].each do |axis|
    if planet_a.send("#{axis}_pos") < planet_b.send("#{axis}_pos")
      planet_a.change_velocity(axis, 1)
      planet_b.change_velocity(axis, -1)
    elsif planet_a.send("#{axis}_pos") > planet_b.send("#{axis}_pos")
      planet_a.change_velocity(axis, -1)
      planet_b.change_velocity(axis, 1)
    end
  end
end

sys = System.new(test)

counter = 0
loop do
  counter += 1
  sys.tick!

  puts counter if (counter % 1000).zero?
  break if sys.planets.all?(&:finished?)
end

puts counter

debugger
