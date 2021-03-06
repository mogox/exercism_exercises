class BookKeeping
  VERSION = 3
end

class LeapYear
  def initialize(year)
    @year = year
  end

  def leap?
    divisible_by_4? && (divisible_by_400? || !divisible_by_100?)
  end

  private

  def year
    @year
  end

  def divisible_by_4?
    (year % 4).zero?
  end

  def divisible_by_100?
    (year % 100).zero?
  end

  def divisible_by_400?
    (year % 400).zero?
  end
end

class Year
  def self.leap?(year)
    LeapYear.new(year).leap?
  end
end
