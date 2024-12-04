# frozen_string_literal: true

require "debug"

def hex_2_bin(hex) = [hex].pack("H*").unpack1("B*").chars

def bin_2_hex(bin) = bin.unpack1("H*")

def bits_2_int(bits) = bits.join.to_i(2)

class Packet
  attr_reader :bin, :version, :type, :a, :b, :c,
              :length_type_id, :bits

  def initialize(bin: nil, hex: nil)
    @bin = bin || hex_2_bin(hex)
  end

  def parse
    @version = bits_2_int(bin.shift(3))
    @type    = bits_2_int(bin.shift(3))

    if @type == 4
      # Literal Value
      bin.shift(1)
      @a = bin.shift(4)

      bin.shift(1)
      @b = bin.shift(4)

      bin.shift(1)
      @c = bin.shift(4)
    else
      # operator
      @length_type_id = bin.shift(1).first.to_i
      @bits = bits_2_int(if @length_type_id.zero?
                           # total length in bits
                           bin.shift(15)
                         else
                           # number of sub packets in child
                           bin.shift(11)
                         end)
    end
  end

  def literal_value
    bits_2_int(a + b + c)
  end
end

pkt = Packet.new(hex: "D2FE28")
pkt.parse
puts "Packet Literal Value Wrong" unless pkt.literal_value == 2021

pkt = Packet.new(hex: "38006F45291200")
pkt.parse

binding.b
