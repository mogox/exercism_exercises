class BookKeeping
  VERSION = 4
end

class Complement
  NUCLEOTIDE_COMPLEMENT = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U',
  }
  def self.of_dna(dna)
    dna.each_char.map { |strand| 
      NUCLEOTIDE_COMPLEMENT.fetch(strand){
        return ''
      }
    }.join
  end
end
