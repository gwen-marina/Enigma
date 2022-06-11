require 'pry'
require 'keys'

class Encrypt
  attr_reader :alphabet,
              :keys,
              :shift_one,
              :shift_two,
              :shift_three,
              :shift_four

  def initialize
    @alphabet = ("a".."z").to_a << " "
    @keys = Keys.new
    @shift_one = rotate_shift(@keys.combine_key_offset[0])
    @shift_two = rotate_shift(@keys.combine_key_offset[1])
    @shift_three = rotate_shift(@keys.combine_key_offset[2])
    @shift_four = rotate_shift(@keys.combine_key_offset[3])
  end

  def rotate_shift(offset)
    rotated_characters = alphabet.rotate(offset)
    alphabet.zip(rotated_characters).to_h
  end

end
