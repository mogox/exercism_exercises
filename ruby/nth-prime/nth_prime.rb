require 'byebug'

class BookKeeping
  VERSION = 1
end

FIRST_PRIME = 2
SECOND_PRIME = 3

class Prime
  def self.nth(number)
    raise ArgumentError if number <= 0
    return FIRST_PRIME if number == 1
    calculate_prime(number, SECOND_PRIME)
  end

  def self.calculate_prime(number, nth_prime)
    counter = nth_prime
    prime_index = 1
    while prime_index < number do
      if prime? counter
        prime_index += 1
        nth_prime = counter
      end
      counter += 2
    end
    nth_prime
  end

  def self.prime?(number)
    return false if number <= 1
    sqrt = Math.sqrt(number).to_i
    sqrt.downto(2).each do |index|
      return false if (number % index).zero?
    end
    true
  end
end
