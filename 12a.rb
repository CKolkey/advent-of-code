# frozen_string_literal: true

DIRECTIONS = File.readlines("12.input").map { |dir| [dir[0].to_sym, dir[1..].to_i] }

class Ship
  def initialize(directions)
    @directions = directions
    @heading = :E
    @x_pos   = 0
    @y_pos   = 0
  end

  def compute_course
    @directions.each do |instruction, n|
      case instruction
      when :N, :S, :E, :W
        move(instruction, n)
      when :L, :R
        update_heading(instruction, n)
      when :F
        move(@heading, n)
      end
    end
  end

  def abs_position
    { x: @x_pos.abs, y: @y_pos.abs }
  end

  private

  def update_heading(relative_action, n)
    @heading = case @heading
               when :N
                 relative_action == :R ? :E : :W
               when :S
                 relative_action == :R ? :W : :E
               when :E
                 relative_action == :R ? :S : :N
               when :W
                 relative_action == :R ? :N : :S
               end

    update_heading(relative_action, n - 90) if (n - 90).positive?
  end

  def move(cardinal, n)
    case cardinal
    when :N
      @y_pos += n
    when :S
      @y_pos -= n
    when :E
      @x_pos += n
    when :W
      @x_pos -= n
    end
  end
end

ship = Ship.new(DIRECTIONS)
ship.compute_course
puts ship.abs_position.values.sum
