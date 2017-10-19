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

  def convert(number)
    ROMAN_NUMERALS.keys.reverse.inject('') { |roman, decimal|
      times = number / decimal
      number = number % decimal
      roman << (ROMAN_NUMERALS[decimal] * times)
    }
  end
end
