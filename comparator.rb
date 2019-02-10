require 'string/similarity'
require 'trigram'
require 'amatch'
# include Amatch
require 'pry'

class StringSimilarityAlgorithms
  def comparator_json(word1, word2)
    {
      cosine: compare_with_cosine(word1, word2),
      levenshtein: compare_with_levenshtein(word1, word2),
      levenshtein_distance: compare_with_levenshtein_distance(word1, word2),
      trigram: compare_with_trigram(word1, word2),
      jaro_winkler: compare_with_jaro_winkler(word1, word2),
      jaro: compare_with_jaro(word1, word2)
    }
  end

  def compare_with_cosine(word1, word2)
    String::Similarity.cosine(word1, word2).round(3)
  end

  def compare_with_levenshtein(word1, word2)
    String::Similarity.levenshtein(word1, word2).round(3)
  end

  def compare_with_levenshtein_distance(word1, word2)
    String::Similarity.levenshtein_distance(word1, word2).round(3)
  end

  def compare_with_trigram(word1, word2)
    Trigram.compare(word1, word2).round(3)
  end

  def compare_with_jaro_winkler(word1, word2)
    m = Amatch::JaroWinkler.new(word1)
    m.match(word2).round(3)
  end

  def compare_with_jaro(word1, word2)
    m = Amatch::Jaro.new(word1)
    m.match(word2).round(3)
  end
end

puts StringSimilarityAlgorithms.new.comparator_json('foo', 'bar')
