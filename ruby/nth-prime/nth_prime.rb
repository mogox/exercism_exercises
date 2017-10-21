require 'byebug'

class BookKeeping
  VERSION = 1
end

class Prime
  def self.nth(number)
    raise ArgumentError if number <= 0
    return 2 if number == 1
    nth_prime = 3
    counter = nth_prime
    prime_index = 1
    while(prime_index < number) do
      if is_prime? counter
        prime_index += 1
        nth_prime = counter
      end
      counter += 2
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
