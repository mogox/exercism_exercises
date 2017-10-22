class Phrase
  def initialize(phrase)
    @words = break_into_words(phrase)
  end

  def word_count
    @words.each_with_object({}) do |token, memo|
      memo[token] = memo.fetch(token, 0) + 1
      memo
    end
  end

  private

  def break_into_words(phrase)
    phrase.downcase.scan(/\b[a-z0-9']+\b/)
  end
end

class BookKeeping
  VERSION = 1
end
