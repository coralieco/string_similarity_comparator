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

First thing first, add this line to your Gemfile

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

### 1. Overview as gem

You can test it in console right away.

```
>> require 'string_similarity_comparator'
true
```

```
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
>> StringSimilarityComparator::Pool.new('foo', 'bar').calculate
```

### 2. Overview as sinatra API

```
$ git clone git@github.com:coralieco/string_similarity_comparator.git
```

Then

```
$ cd string_similarity_comparator
$ bundle
$ ruby lib/string_similarity_comparator/app.rb
```

Go on the browser, usually on `localhost:4567`

Then use one of the endpoint:

1. with the form: <http://localhost:4567/>

2. with the url directly: <http://localhost:4567/api/v1/string_similarity?string_a=foo&string_b=bar>


## Article

I wrote an article about what we do at Appaloosa Store to customize application recommendation using String Similarity Algorithms: [String Similarity Algorithms Compared](https://medium.com/@appaloosastore/string-similarity-algorithms-compared-3f7b4d12f0ff)

It compares some of these algorithms and explain why I chose to use the Jaro-Winkler algorithm in Appaloosa use-case.

## License

Using gem work of:
See the LICENSE file in the source.

[JaroWinkler](https://github.com/tonytonyjan/jaro_winkler/blob/master/README.md): Copyright (c) 2014 Jian Weihang

[amatch](https://github.com/flori/amatch/blob/master/README.md): Copyright [2017] [Florian Frank]

[string-similarity](https://github.com/mhutter/string-similarity): Copyright (c) 2015 Manuel Hutter

[Trigram](https://github.com/milk1000cc/trigram): Copyright (c) 2014 milk1000cc
