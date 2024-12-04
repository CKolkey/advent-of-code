# frozen_string_literal: true

require "debug"

class Packet
  def self.for(binary)
    if literal?(binary)
      Literal.new(binary)
    else
      Operator.new(binary)
    end
  end

  # type_id header
  def self.literal?(binary)
    binary[3..5].join.to_i(2) == 4
  end

  attr_reader :dec

  def initialize(dec)
    @dec = dec
  end

  def version     = dec[0..2].join.to_i(2)
  # def type_id     = dec.slice(3..5).to_i(2)
end

class Literal < Packet
  def inspect = "< Literal | version: #{version}, value: #{parse} >"

  def parse
    @parse ||= dec.slice(6..)
                  .each_slice(5)
                  .to_a
                  .delete_if { _1.length < 5 && _1.to_i.zero?}
                  .map { _1.slice(1..) }
                  .join
                  .to_i(2)
  end
end

class Operator < Packet
  def initialize(dec)
    super
    @subpackets = []
  end

  def parse
    if length_type.zero?
      packet, extra = Packet.for(data)
      @subpackets << packet
    else
      length_header.times { @subpackets << Packet.for(data) }
    end

    self
  end

  def length_type = dec[6].to_i

data
    dec[(7 + length_header_bits)..]
  end

  def length_header
    dec[7...((length_header_bits) + 7)].join.to_i(2)
  end

  def length_header_bits = length_type.zero? ? 15 : 11

  def inspect = "<Operator | #{@subpackets}, Ver: #{version}>"
end

def hex_2_dec(hex)
  hex.chars.map { _1.hex.to_s(2).rjust(4, "0") }.join.chars.map(&:to_i)
end

# input = "D2FE28" # Literal Packet
input = "38006F45291200" # Operator Packet

test  = Packet.for(hex_2_dec(input)).parse
p test

debugger
