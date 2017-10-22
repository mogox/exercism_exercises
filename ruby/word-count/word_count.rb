class Phrase

  def initialize(phrase)
    @phrase = cleanup(phrase)
  end

  def word_count
    phrase.split(/\s/).inject({}) do |memo, word|
      token = word.count("'") == 2 ? word.gsub(/'/i, '') : word
      token = token.downcase
      memo[token] = memo.fetch(token, 0) + 1
      memo
    end
  end

  private

  def phrase
    @phrase
  end

  def cleanup(phrase)
    phrase.gsub(/[\.,]/, ' ').gsub('  ', ' ').gsub(/[^0-9a-z' ]/i, '')
  end
end

class BookKeeping
  VERSION = 1
end
