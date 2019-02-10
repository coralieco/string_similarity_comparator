require 'string/similarity'
require 'trigram'
require 'amatch'
require 'pry'

class StringSimilarityAlgorithms
  attr_reader :word_a, :word_b

  def initialize(word_a, word_b)
    @word_a = word_a
    @word_b = word_b
  end

  def compare
    {
      cosine: compare_with_cosine,
      levenshtein: compare_with_levenshtein,
      levenshtein_distance: compare_with_levenshtein_distance,
      trigram: compare_with_trigram,
      jaro_winkler: compare_with_jaro_winkler,
      jaro: compare_with_jaro,
      hamming: compare_with_hamming
    }
  end

  # https://en.wikipedia.org/wiki/Cosine_similarity
  def compare_with_cosine
    String::Similarity.cosine(word_a, word_b).round(3)
  end

  # https://en.wikipedia.org/wiki/Levenshtein_distance
  def compare_with_levenshtein_distance
    String::Similarity.levenshtein_distance(word_a, word_b).round(3)
  end

  def compare_with_levenshtein
    String::Similarity.levenshtein(word_a, word_b).round(3)
  end

  # https://en.wikipedia.org/wiki/Trigram
  def compare_with_trigram
    Trigram.compare(word_a, word_b).round(3)
  end

  # https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance
  def compare_with_jaro_winkler
    m = Amatch::JaroWinkler.new(word_a)
    m.match(word_b).round(3)
  end

  def compare_with_jaro
    m = Amatch::Jaro.new(word_a)
    m.match(word_b).round(3)
  end

  # https://en.wikipedia.org/wiki/Hamming_code
  def compare_with_hamming
    m = Amatch::Hamming.new(word_a)
    m.match(word_b).round(3)
  end
end
