require 'pry'

#valid
card_number = "4929735477250542"
cc_1 = "4929735477250543"
cc_2 = "5541808923795240"
cc_3 = "4024007136512380"
cc_4 = "6011797668867828"
cc_amex = "342804633855673"
#invalid
cc_5 = "5541801923795240"
cc_6 = "4024007106512380"
cc_7 = "6011797668868728"
cc_x_amex = "342801633855673"

card_numbers = [cc_1, cc_2, cc_3, cc_4, cc_5, cc_6, cc_7]
amex_numbers = [cc_amex, cc_x_amex]

valid = false

def credit_check(card_number)
  results = 0
  # from the rightmost digit, which is the check digit, moving left, double the value of every second digit
  card_number.split("").reverse.each_with_index do |numbers, second_number|
    if second_number.even?
      results += numbers.to_i
    elsif numbers.to_i * 2 > 9
  # if product of this doubling operation is greater than 9 (e.g., 7 * 2 = 14), then sum the digits of the products (e.g., 10: 1 + 0 = 1, 14: 1 + 4 = 5).
      double = numbers.to_i * 2
      results += double.digits.sum
      # take the sum of all the digits
    else
      results += numbers.to_i * 2
    end
  end

  if results % 10 == 0
    puts "The number is valid"
    # if and only if the total modulo 10 is equal to 0 then the number is valid
  else
    puts "The number is invalid"
  end
end

card_numbers.map {|card_number| credit_check(card_number)}
amex_numbers.map {|card_number| credit_check(card_number)}
