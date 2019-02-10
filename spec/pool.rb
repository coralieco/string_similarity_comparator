require 'spec_helper'

RSpec.describe Pool do
  context 'with different words' do
    context 'with differences in each letter' do
      let(:word_a) { 'foo' }
      let(:word_b) { 'bar' }
      let(:expected_json) {
        {
          cosine: 0.0,
          jaro: 0.0,
          jaro_winkler: 0.0,
          levenshtein: 0.333,
          levenshtein_distance: 3,
          trigram: 0.0,
          hamming: 3
        }
      }

      subject { described_class.new(word_a, word_b).calculate }

      it { is_expected.to include(expected_json) }
    end
  end

  context 'with same words' do
    let(:word_a) { 'foo' }
    let(:word_b) { 'foo' }
    let(:expected_json) {
      {
        cosine: 1.0,
        jaro: 1.0,
        jaro_winkler: 1.0,
        levenshtein: 1.0,
        levenshtein_distance: 0,
        trigram: 1.0,
        hamming: 0
      }
    }

    subject { described_class.new(word_a, word_b).calculate }

    it { is_expected.to include(expected_json) }
  end
end


# String::Similarity.cosine 'mine', 'thyne'
# => 0.4472135954999579
