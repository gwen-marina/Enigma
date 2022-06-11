require 'pry'
class Keys

  def random_key_generator
    rand(10000..99999).to_s.split("").map do |number|
      number
    end
  end

  def key_split
    #1 key = first two digits
    #2 key = second and third digits
    #3 key = third and fourth digits
    #4 key = fourth and fifth digits
    numbers = random_key_generator
    split_1 = numbers[0] + numbers[1]
    split_2 = numbers[1] + numbers[2]
    split_3 = numbers[2] + numbers[3]
    split_4 = numbers[3] + numbers[4]
    [split_1.to_i, split_2.to_i, split_3.to_i, split_4.to_i]
  end

  def offsets
   # Consider the date formatted as a number, DDMMYY. If the date is August 4, 1995, it would be represented as 040895.
   # Square the numeric form (1672401025)
   # Take the last four digits (1025)
   # 1 offset: The first digit (1)
   # 2 offset: The second digit (0)
   # 3 offset: The third digit (2)
   # 4 offset: The fourth digit (5)
   date = Time.new.strftime("%d%m%y").to_i
   last_four_digits = date ** 2
   offset = last_four_digits.to_s[-4..-1].split("")
   offset_1 = offset[0]
   offset_2 = offset[1]
   offset_3 = offset[2]
   offset_4 = offset[3]
   [offset_1.to_i, offset_2.to_i, offset_3.to_i, offset_4.to_i]
  end

  def combine_key_offset
    keys = key_split
    offset = offsets
    [keys[0] + offset[0], keys[1] + offset[1], keys[2] + offset[2], keys[3] + offset[3]]
  end
end
