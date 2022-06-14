module Checkable

  def check_correct_input(key, date)
    if key.length != 5 || date.length != 6
      puts "The data you've supplied is incorrect. Please enter a 5 digit number, and the date as 'DDMMYY'."
      abort
    end
  end
end
