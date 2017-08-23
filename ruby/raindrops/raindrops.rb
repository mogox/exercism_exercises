class BookKeeping
  VERSION = 3
end

class Raindrops
  RULES = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong',
  }

  def self.convert(number)
    rain_digits = translate(number)
    rain_digits.empty? ? number.to_s : rain_digits
  end

  def self.translate(number)
    RULES.select{ |key|
      (number % key).zero?
    }.values.join
  end
end
