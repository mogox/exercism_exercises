module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute(strand1, strand2)
    raise_invalid_size unless strand1.length == strand2.length
    strand1.chars.zip(strand2.chars).count { |x, y|
      x != y
    }
  end

  def self.raise_invalid_size
    raise ArgumentError, "Strands of different size are not allowed"
  end
end
