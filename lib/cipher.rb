require_relative 'keys'

class Cipher
  attr_reader :alphabet,
              :keys,
              :shift_one,
              :shift_two,
              :shift_three,
              :shift_four

  def initialize(keys = nil)
    @alphabet = ("a".."z").to_a << " "
    @keys = keys || Keys.new
    @shift_one = rotate_shift(@keys.combine_key_offset[0])
    @shift_two = rotate_shift(@keys.combine_key_offset[1])
    @shift_three = rotate_shift(@keys.combine_key_offset[2])
    @shift_four = rotate_shift(@keys.combine_key_offset[3])
  end

  def rotate_shift(offset)
    rotated_characters = alphabet.rotate(offset)
    alphabet.zip(rotated_characters).to_h
  end

  def cipher(message)
    counter = 0
    encrypted_letters = []
    message.downcase.split("").each do |letter|
      if !@alphabet.include?(letter)
        encrypted_letters << letter
      end
      if counter == 0
        encrypted_letters << shift_one[letter]
        counter += 1
      elsif counter == 1
        encrypted_letters << shift_two[letter]
        counter += 1
      elsif counter == 2
        encrypted_letters << shift_three[letter]
        counter += 1
      elsif counter == 3
        encrypted_letters << shift_four[letter]
        counter = 0
      end
    end
    encrypted_letters.join
  end

  def decipher(message)
    counter = 0
    unencrypted_letters = []
    message.downcase.split("").each do |letter|
      if !@alphabet.include?(letter) 
        unencrypted_letters << letter
      end
      if counter == 0
        unencrypted_letters << shift_one.index(letter)
        counter += 1
      elsif counter == 1
        unencrypted_letters << shift_two.index(letter)
        counter += 1
      elsif counter == 2
        unencrypted_letters << shift_three.index(letter)
        counter += 1
      elsif counter == 3
        unencrypted_letters << shift_four.index(letter)
        counter = 0
      end
    end
    unencrypted_letters.join
  end
end
