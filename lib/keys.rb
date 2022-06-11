require 'pry'
class Keys

  def random_key_generator
    rand(10000..99999).to_s.split("").map do |number|
      number
    end
  end

 
end
