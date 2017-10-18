require 'byebug'

class BookKeeping
  VERSION = 2
end

class Integer
  def to_roman
    translator = RomanConverter.new
    translator.convert(self)
  end
end

class RomanConverter
  ROMAN_NUMERALS = {
     1      => "I",
     4      => "IV",
     5      => "V",
     9      => "IX",
     10     => "X",
     40     => "XL",
     50     => "L",
     90     => "XC",
     100    => "C",
     400    => "CD",
     500    => "D",
     900    => "CM",
     1000   => "M"
  }

  FIVE_ROMAN = {
    1 => "I",
    2 => "II",
    3 => "III",
    4 => "IV",
    5 => "V"
  }

  def convert(number)
    result = ''
    next_number = number
    current_number = number
    while current_number > 0 do
      if current_number >= 1000
        result = ROMAN_NUMERALS[1000] + result
        next_number = current_number - 1000
      elsif current_number >= 900 && current_number < 1000
        result = ROMAN_NUMERALS[900] + result
        next_number = current_number - 900
      elsif current_number > 500
        result = ROMAN_NUMERALS[500] + result
        next_number = current_number - 500
      elsif current_number >= 400 && current_number < 500
        result = ROMAN_NUMERALS[400] + result
        next_number = current_number - 400
      elsif current_number >= 100
        result = ROMAN_NUMERALS[100] + result
        next_number = current_number - 100
      elsif current_number >= 90 && current_number < 100
        result = result + ROMAN_NUMERALS[90]
        next_number = current_number - 90
      elsif current_number >= 50
        result = result + ROMAN_NUMERALS[50]
        next_number = current_number - 50
      elsif current_number >= 40  && current_number < 50
        result = result + ROMAN_NUMERALS[40]
        next_number = current_number - 40
      elsif current_number >= 10
        result = result + ROMAN_NUMERALS[10]
        next_number = current_number - 10
      elsif current_number == 9
        result = result + ROMAN_NUMERALS[9]
        next_number = current_number - 9
      elsif current_number < 9 && current_number > 5
        result << ROMAN_NUMERALS[5]
        next_number = current_number - 5
      elsif current_number == 4
        result << ROMAN_NUMERALS[4]
        next_number = current_number - 4
      elsif current_number <= 5
        result << FIVE_ROMAN[current_number]
        next_number = current_number - current_number
      end
      current_number = next_number
    end
    result
  end
end
