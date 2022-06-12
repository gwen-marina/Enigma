class Keys
  attr_reader :key,
              :date

  def initialize(key = nil, date = nil)
    @date = date || Time.new.strftime("%d%m%y")
    @key = key || random_key_generator.join
  end

  def random_key_generator
    rand(00000..99999).to_s.rjust(5, '0').split("").map do |number|
      number
    end
  end

  def key_split
    split_1 = key[0] + key[1]
    split_2 = key[1] + key[2]
    split_3 = key[2] + key[3]
    split_4 = key[3] + key[4]
    [split_1.to_i, split_2.to_i, split_3.to_i, split_4.to_i]
  end

  def offsets
   last_four_digits = date.to_i ** 2
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
