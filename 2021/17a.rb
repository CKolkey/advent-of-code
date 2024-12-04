# frozen_string_literal: true

require "debug"

TARGET = { x: 20..30, y: -10..-5 }.freeze

class Probe
  attr_reader :y_pos, :x_pos

  def initialize(x_speed, y_speed)
    @x_speed = x_speed
    @y_speed = y_speed
    @x_pos   = 0
    @y_pos   = 0
  end

  def step
    @x_pos += @x_speed
    @y_pos += @y_speed

    @x_speed += if @x_speed.zero?
                  0
                else
                  @x_speed.positive? ? -1 : 1
                end

    @y_speed -= 1
  end

  def on_target?
    TARGET[:x].cover?(x_pos) &&
      TARGET[:y].cover?(y_pos)
  end

  def overshot_target?
    x_pos > TARGET[:x].max ||
      y_pos < TARGET[:y].min
  end
end

binding.b
