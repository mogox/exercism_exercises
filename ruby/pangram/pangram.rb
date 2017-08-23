module BookKeeping
 VERSION = 3
end

class Pangram

  ALPHABET = ('a'..'z')

  def self.pangram?(phrase)
    text = phrase.downcase
    ALPHABET.all? { |letter| text.include?(letter) }
  end

end
