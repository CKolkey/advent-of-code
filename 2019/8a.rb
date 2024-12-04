require 'debug'

input = File.read('8.input').strip.chars.map(&:to_i)

def slice_and_dice(length, input)
  layers = []
  layers << input.shift(length) until input.empty?
  layers
end

input = slice_and_dice(150, input)
layer = input.min_by { _1.count(0) }
output = layer.count(1) * layer.count(2)

binding.b
