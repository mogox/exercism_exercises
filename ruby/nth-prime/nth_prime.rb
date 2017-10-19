require 'byebug'

class BookKeeping
  VERSION = 1
end

class Prime
  def self.nth(number)
    raise ArgumentError if number <= 0
    nth_prime = 2
    counter = nth_prime
    prime_index = 1
    primes = []
    while(prime_index < number) do
      counter += 1
      if is_prime? counter
        primes << counter
        prime_index += 1
        nth_prime = counter
      end
      counter += 1
    end
    nth_prime
  end

  def self.is_prime?(number)
    return false if number <= 1
    sqrt = Math.sqrt(number).to_i
    sqrt.downto(2).each{ |index|
      return false if number % index == 0
    }
    true
  end
end
