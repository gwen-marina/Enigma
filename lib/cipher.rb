require_relative 'keys'

class Cipher
  attr_reader :alphabet,
              :keys

  def initialize(keys = nil)
    @alphabet = ("a".."z").to_a << " "
    @keys = keys || Keys.new
    @shift_one = rotate_shift(@keys.combine_key_offset[0])
    @shift_two = rotate_shift(@keys.combine_key_offset[1])
    @shift_three = rotate_shift(@keys.combine_key_offset[2])
    @shift_four = rotate_shift(@keys.combine_key_offset[3])
    @shifts = [@shift_one, @shift_two, @shift_three, @shift_four]
    @letters = []
    @counter = 0
  end

  def rotate_shift(offset)
    rotated_characters = alphabet.rotate(offset)
    alphabet.zip(rotated_characters).to_h
  end

  def special_chars(letter)
    if !@alphabet.include?(letter)
      @letters << letter
    end
  end

  def cipher(message)
    message.downcase.split("").each do |letter|
      special_chars(letter)
      @letters << @shifts[@counter][letter]
      @counter += 1
        @counter = 0 if @counter == 4
    end
    @letters.join
  end

  def decipher(message)
    message.downcase.split("").each do |letter|
      special_chars(letter)
      @letters << @shifts[@counter].index(letter)
      @counter += 1
        @counter = 0 if @counter == 4
      end
    @letters.join
  end
end
