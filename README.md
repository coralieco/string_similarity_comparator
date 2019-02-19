# string_similarity_comparator

Return a `json` aggregating different algorithms to compare strings.
This can help compare results from different algorithms and better choose the most appropriate depending of the objective.

## Algorithms

- [Cosine](https://en.wikipedia.org/wiki/Cosine_similarity)
- [Levenshtein distance](https://en.wikipedia.org/wiki/Levenshtein_distance)
- Levenshtein
- [Trigram](https://en.wikipedia.org/wiki/Trigram)
- [Jaro Winkler](https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance)
- Jaro
- [Hamming](https://en.wikipedia.org/wiki/Hamming_code)

## Installation

First thing first, add this line in your Gemfile

```ruby
gem 'string_similarity_comparator'
```

Then, run

```
$ bundle
```

Or install it yourself as:

```
$ gem install 'string_similarity_comparator'
```

## Usage

### Overview

You can test it in console right away.

```
>> require 'string_similarity_comparator'
true

>> StringSimilarityComparator::Pool.new('foo', 'bar').calculate
{
                  :cosine => 0.0,
             :levenshtein => 0.333,
    :levenshtein_distance => 3,
                 :trigram => 0.0,
            :jaro_winkler => 0.0,
                    :jaro => 0.0,
                 :hamming => 3
}
```

To compare two words, 'foo' and 'bar' for example, call

```
StringSimilarityComparator::Pool.new('foo', 'bar').calculate
```

## Article

I wrote an article about what we do at Appaloosa Store to customize application recommendation using String Similarity Algorithms: [String Similarity Algorithms Compared](https://medium.com/@appaloosastore/string-similarity-algorithms-compared-3f7b4d12f0ff)

It compares some of these algorithms and explain why I chose to use the Jaro-Winkler algorithm in Appaloosa use-case.

## License

Using repositories of:

- [amatch](https://github.com/flori/amatch/blob/master/README.md)
Apache License, Version 2.0 – See the COPYING file in the source archive.

- [string-similarity](https://github.com/mhutter/string-similarity)

- [Trigram](https://github.com/milk1000cc/trigram)
