class Phrase

  def initialize(phrase)
    @phrase = phrase.gsub(/[\.,]/,' ').gsub('  ',' ').gsub(/[^0-9a-z' ]/i, '')
    @word_count = { }
    calculate_words
  end

  def word_count
    @word_count
  end

  private

  def phrase
    @phrase
  end

  def calculate_words
    phrase.split(/\s/).each do |word|
      token = word.count("'") == 2 ? word.gsub(/'/i,'') : word
      token = token.downcase
      @word_count[token] = @word_count.fetch(token,0) +1
    end
  end
end

class BookKeeping
  VERSION = 1
end
