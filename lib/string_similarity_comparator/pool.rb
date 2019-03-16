require 'trigram'
require 'string-similarity'
require 'jaro_winkler'
require 'amatch'

module StringSimilarityComparator
  class Pool
    attr_reader :word_a, :word_b

    def initialize(word_a, word_b)
      @word_a = word_a
      @word_b = word_b
    end

    def calculate
      {
        cosine: cosine,
        levenshtein: levenshtein,
        levenshtein_distance: levenshtein_distance,
        trigram: trigram,
        jaro_winkler: jaro_winkler,
        jaro: jaro,
        hamming: hamming
      }
    end

    # https://en.wikipedia.org/wiki/Cosine_similarity
    def cosine
      String::Similarity.cosine(word_a, word_b).round(3)
    end

    # https://en.wikipedia.org/wiki/Levenshtein_distance
    def levenshtein_distance
      String::Similarity.levenshtein_distance(word_a, word_b).round(3)
    end

    def levenshtein
      String::Similarity.levenshtein(word_a, word_b).round(3)
    end

    # https://en.wikipedia.org/wiki/Trigram
    def trigram
      Trigram.compare(word_a, word_b).round(3)
    end

    # https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance
    def jaro_winkler
      JaroWinkler.distance(word_a, word_b).round(3)
    end

    def jaro
      JaroWinkler.jaro_distance(word_a, word_b).round(3)
    end

    # https://en.wikipedia.org/wiki/Hamming_code
    def hamming
      m = Amatch::Hamming.new(word_a)
      m.match(word_b).round(3)
    end
  end
end
