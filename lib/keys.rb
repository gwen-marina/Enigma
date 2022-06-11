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
    [split_1, split_2, split_3, split_4]
  end

end
