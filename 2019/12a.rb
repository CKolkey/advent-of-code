require 'debug'

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

class Planet
  attr_reader :x_pos, :y_pos, :z_pos

  def initialize(name, x_pos, y_pos, z_pos)
    @name = name

    @x_pos = x_pos
    @y_pos = y_pos
    @z_pos = z_pos

    @x_velocity = 0
    @y_velocity = 0
    @z_velocity = 0
  end

  def inspect
    position = "pos:(#{x_pos}, #{y_pos}, #{z_pos})".ljust(20, ' ')
    velocity = "vel:(#{@x_velocity}, #{@y_velocity}, #{@z_velocity})"
    "<#{@name}: #{position} #{velocity}>"
  end

  def tick!
    @x_pos += @x_velocity
    @y_pos += @y_velocity
    @z_pos += @z_velocity
  end

  def change_velocity(axis, delta)
    case axis
    when :x then @x_velocity += delta
    when :y then @y_velocity += delta
    when :z then @z_velocity += delta
    end
  end

  def potential_energy
    [@x_pos, @y_pos, @z_pos].map(&:abs).sum
  end

  def kinetic_energy
    [@x_velocity, @y_velocity, @z_velocity].map(&:abs).sum
  end

  def total_energy
    potential_energy * kinetic_energy
  end
end

class System
  attr_reader :planets

  def initialize(input)
    @input   = parse(input)
    @planets = @input.map.with_index { Planet.new(%w[A B C D][_2], *_1) }
  end

  def planet_pairs
    planets.combination(2).to_a
  end

  def tick!
    planet_pairs.map { apply_gravity(*_1) }
    planets.map(&:tick!)
    self
  end

  def total_energy
    planets.sum(&:total_energy)
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

sys = System.new(input)

1000.times { sys.tick! }
puts sys.total_energy

debugger
