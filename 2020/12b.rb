# frozen_string_literal: true

class Waypoint
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def position
    [@x, @y]
  end

  def move(heading, units)
    case heading
    when :N
      @y += units
    when :S
      @y -= units
    when :E
      @x += units
    when :W
      @x -= units
    end
  end

  def rotate(direction, degrees)
    radians = (degrees * (Math::PI / 180)) * (direction == :R ? -1 : 1)
    cos = Math.cos(radians)
    sin = Math.sin(radians)

    @x, @y = (@x * cos - @y * sin).round, (@x * sin + @y * cos).round
  end
end

class Ship
  attr_reader :x, :y

  def initialize
    @x = 0
    @y = 0
  end

  def position
    [@x, @y]
  end

  def move(n, waypoint_x, waypoint_y)
    n.times do
      @x += waypoint_x
      @y += waypoint_y
    end
  end
end

class Map
  attr_reader :ship, :waypoint

  def initialize(waypoint, ship, instructions)
    @ship         = ship
    @waypoint     = waypoint
    @instructions = parse_instructions(instructions)
  end

  def chart_course
    @instructions.each { |(instruction, n)| action(instruction, n) }
  end

  private

  def action(instruction, n)
    case instruction
    when :N, :S, :E, :W
      @waypoint.move(instruction, n)
    when :L, :R
      @waypoint.rotate(instruction, n)
    when :F
      @ship.move(n, *waypoint.position)
    end
  end

  def parse_instructions(instructions)
    instructions.map { |dir| [dir[0].to_sym, dir[1..].to_i] }
  end
end

map = Map.new(Waypoint.new(10, 1), Ship.new, File.readlines("12.input"))
map.chart_course
p map.ship.position.sum(&:abs)
