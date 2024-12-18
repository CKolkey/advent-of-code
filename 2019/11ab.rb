require 'debug'
require_relative 'intcode_processor'

program = <<~PROG
  3,8,1005,8,350,1106,0,11,0,0,0,104,1,104,0,3,8,1002,8,-1,10,101,1,10,10,4,10,1008,8,1,10,4,10,102,1,8,29,1006,0,82,1006,0,40,3,8,1002,8,-1,10,101,1,10,10,4,10,1008,8,0,10,4,10,1002,8,1,57,1,102,15,10,1,1005,14,10,1006,0,33,3,8,102,-1,8,10,101,1,10,10,4,10,1008,8,0,10,4,10,102,1,8,90,1,1008,14,10,2,3,19,10,1006,0,35,1006,0,21,3,8,102,-1,8,10,1001,10,1,10,4,10,108,1,8,10,4,10,1002,8,1,125,1,1105,11,10,2,1105,9,10,1,4,1,10,2,1,4,10,3,8,1002,8,-1,10,101,1,10,10,4,10,1008,8,0,10,4,10,101,0,8,164,1006,0,71,3,8,102,-1,8,10,101,1,10,10,4,10,1008,8,0,10,4,10,1002,8,1,189,1006,0,2,1,5,17,10,1006,0,76,1,1002,7,10,3,8,1002,8,-1,10,101,1,10,10,4,10,108,1,8,10,4,10,1001,8,0,224,1,3,5,10,3,8,1002,8,-1,10,101,1,10,10,4,10,108,1,8,10,4,10,101,0,8,250,1,1,20,10,1,102,13,10,2,101,18,10,3,8,1002,8,-1,10,101,1,10,10,4,10,108,0,8,10,4,10,102,1,8,284,2,105,0,10,1,105,20,10,3,8,1002,8,-1,10,101,1,10,10,4,10,1008,8,1,10,4,10,1002,8,1,315,1006,0,88,1,2,4,10,2,8,17,10,2,6,2,10,101,1,9,9,1007,9,1056,10,1005,10,15,99,109,672,104,0,104,1,21102,1,847069688728,1,21101,0,367,0,1106,0,471,21102,386577216404,1,1,21102,378,1,0,1105,1,471,3,10,104,0,104,1,3,10,104,0,104,0,3,10,104,0,104,1,3,10,104,0,104,1,3,10,104,0,104,0,3,10,104,0,104,1,21101,97952923867,0,1,21102,425,1,0,1106,0,471,21101,0,29033143319,1,21102,436,1,0,1105,1,471,3,10,104,0,104,0,3,10,104,0,104,0,21102,1,868410614628,1,21101,0,459,0,1105,1,471,21101,837896909672,0,1,21101,0,470,0,1105,1,471,99,109,2,22102,1,-1,1,21101,40,0,2,21102,502,1,3,21102,492,1,0,1106,0,535,109,-2,2105,1,0,0,1,0,0,1,109,2,3,10,204,-1,1001,497,498,513,4,0,1001,497,1,497,108,4,497,10,1006,10,529,1102,1,0,497,109,-2,2105,1,0,0,109,4,2101,0,-1,534,1207,-3,0,10,1006,10,552,21101,0,0,-3,22101,0,-3,1,22101,0,-2,2,21102,1,1,3,21101,571,0,0,1106,0,576,109,-4,2106,0,0,109,5,1207,-3,1,10,1006,10,599,2207,-4,-2,10,1006,10,599,21202,-4,1,-4,1105,1,667,21202,-4,1,1,21201,-3,-1,2,21202,-2,2,3,21102,1,618,0,1106,0,576,21201,1,0,-4,21101,0,1,-1,2207,-4,-2,10,1006,10,637,21102,0,1,-1,22202,-2,-1,-2,2107,0,-3,10,1006,10,659,21202,-1,1,1,21101,659,0,0,106,0,534,21202,-2,-1,-2,22201,-4,-2,-4,109,-5,2105,1,0
PROG

class Robot
  attr_reader :x, :y, :map, :path

  def initialize(program)
    @opcodes = Opcodes.new
    @processor = IntcodeProcessor.new(program, @opcodes)

    @heading = 0
    @x = @y = 0
    @map = Hash.new { 0 }
    @path = []
  end

  def run!
    # Part A: input 0, Part B: Input 1
    paint_tile!(1)

    loop do
      @path.push([@x, @y, @heading % 360])
      @opcodes.overload_fn(3, opcode3(tile_color))
      @processor.run!
      color, turn = @processor.pop(2)

      paint_tile!(color)
      change_heading(turn)
      advance!

      print
      sleep 0.02
      break if @processor.halted?
    end
  end

  def print
    `clear`

    # normalize negative coordinates
    x_offset = @map.keys.map(&:first).min.abs
    y_offset = @map.keys.map(&:last).min.abs
    map      = @map.transform_keys { |(x, y)| [x + x_offset, y + y_offset] }

    # Correct off-by-one array index/coordinate
    x_max = map.keys.map(&:first).max + 1
    y_max = map.keys.map(&:last).max  + 1

    # Build Empty Map
    grid = []
    y_max.times { grid << [] }
    grid.each { |row| x_max.times { row << ' ' } }

    # Populate
    map.each { |(col, row), color| grid[row][col] = color.zero? ? '.' : '#' }

    pointer = case @heading % 360
              when 0 then '^'
              when 90 then '>'
              when 180 then 'V'
              when 270 then '<'
              end

    grid[@y + y_offset][@x + x_offset] = pointer
  rescue StandardError
    grid[@y + y_offset - 1][@x + x_offset - 1] = pointer
  ensure
    puts grid.reverse.map(&:join).join("\n")
  end

  private

  def paint_tile!(color)
    @map[[@x, @y]] = color
  end

  def change_heading(turn)
    case turn
    when 0 then @heading -= 90
    when 1 then @heading += 90
    end
  end

  def advance!
    case @heading % 360
    when 0   then @y += 1
    when 90  then @x += 1
    when 180 then @y -= 1
    when 270 then @x -= 1
    end
  end

  def tile_color
    @map[[@x, @y]]
  end

  # print('Input > #{input}') or write!(address(a, 0), #{input}) and next!
  def opcode3(input)
    eval <<~FN
      ->(a) {
        opcodes.overload_fn(3, ->(a) { suspend! })
        write!(address(a, 0), #{input}) and next!
      }
    FN
  end
end

robot = Robot.new(program)
robot.run!

puts "A: #{robot.map.count}"
puts 'B:'
robot.print
