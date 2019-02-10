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

## Usage

To compare two words, call

```
StringSimilarityComparator::Pool.new('foo', 'bar').calculate
```

it returns

```
{
  cosine: 0.0,
  jaro: 0.0,
  jaro_winkler: 0.0,
  levenshtein: 0.333,
  levenshtein_distance: 3,
  trigram: 0.0,
  hamming: 3
}
```

## Article

I wrote an article about what we do at Appaloosa Store to customize application recommendation using String Similarity Algorithms: [String Similarity Algorithms Compared](https://medium.com/@appaloosastore/string-similarity-algorithms-compared-3f7b4d12f0ff)

## License

Using repositories of:

- [amatch](https://github.com/flori/amatch/blob/master/README.md)
Apache License, Version 2.0 – See the COPYING file in the source archive.

- [string-similarity](https://github.com/mhutter/string-similarity)

- [Trigram](https://github.com/milk1000cc/trigram)
