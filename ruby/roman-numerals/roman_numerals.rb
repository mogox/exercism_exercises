class BookKeeping
  VERSION = 2
end

class Integer
  def to_roman
    roman = ""
    roman << hundreds(self % 100 - (self%10)) if self > 10
    roman << tens(self%10)
    roman
  end

  def five(number)
    case(number)
      when 1
        return "I"
      when 2
        return "II"
      when 3
        return "III"
      when 4
        return "IV"
      when 5
        return "V"
    end
    return ""
  end

  def tens(number)
    p "T: #{number}"
    return "IX" if number == 9
    if number > 5
      return "V" + five(number-5)
    else
      return five(number)
    end
  end


  def five_tens(number)
    case(number)
      when 10
        return "X"
      when 20
        return "XX"
      when 30
        return "XXX"
      when 40
        return "XL"
      when 50
        return "L"
    end
  end

  def hundreds(number)
   p "H: #{number}"
   return "XC" if number == 90
   if number > 50
     return "L" + five_tens(number - 50)
   else
    return five_tens(number)
   end
   return ""
  end
end


class RomanConverter
  ROMAN_LETTERS = [ "I", "V", "X", "L", "C", "D", "M"]

  ROMAN_RAW = {
     1: "I",
     5: "V",
     10: "X",
     50: "L",
     100: "C",
     500: "D",
     1000: "M"
  }


  def translate(digit)
    base_letter = get_letter(digit)
  end

  def get_letter(digit)
  end

  def convert(number)
    keys = ROMAN_RAW.keys.reverse
    abc = ""
    num = number
    keys.each do |numeral|
      div = num/numeral
      if div > 0
        abc << translate(div) if div > 0
        num = div
      end
    end
  end

end
