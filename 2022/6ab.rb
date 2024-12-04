# My original implementation - 0.029s runtime
#
# def marker_index(input, preamble)
#   input.chars
#        .each_with_object([]) { |packet, buffer| packet_started?(buffer, preamble:) ? next : buffer << packet }
#        .size
# end
#
# def packet_started?(buffer, preamble:)
#   buffer.last(preamble).uniq.size == preamble
# end

# XOR - 0.0043s runtime
# https://www.mattkeeter.com/blog/2022-12-10-xor/

def marker_index(input, size)
  window = 0
  input.each_with_index do |mask, i|
    # Turn on bit for current letter in string
    window ^= mask

    # Turn off bit once a letter is no longer in the window
    window ^= input[i - size] if i >= size

    # Return index + 1 if correct number of bits are flipped
    return i + 1 if window.to_s(2).count("1") == size
  end
end

# using a hash to compute powers of two lets us memoize the work
bit_masks = Hash.new { _1[_2] = 2**(_2.ord - 97) }
input     = File.read("6.input").chars.map { bit_masks[_1] }

puts marker_index(input, 14) == 2851
puts marker_index(input, 4)  == 1794
