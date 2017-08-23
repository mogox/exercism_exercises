class BookKeeping
  VERSION = 1
end

class Sieve
  START_LIMIT = 2

  def initialize(limit)
    @list = (START_LIMIT..limit).to_a
    sieve(limit)
  end

  def primes
    @list
  end

  private

  def sieve(limit)
    (START_LIMIT..limit).each do |factor|
      remove_multiple(factor)
    end
  end

  def remove_multiple(factor)
    @list.reject! do |number|
      number != factor && (number % factor).zero?
    end
  end
end
