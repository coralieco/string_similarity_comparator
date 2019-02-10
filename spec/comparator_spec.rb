# puts String::Similarity.cosine 'foo', 'bar'
# => 0.0

# String::Similarity.cosine 'mine', 'thyne'
# => 0.4472135954999579

# String::Similarity.cosine 'foo', 'foo'
# => 1.0


# Same for Levenshtein:
# String::Similarity.levenshtein_distance('kitten', 'sitting') # or ...
# => 3

# String::Similarity.levenshtein('foo', 'far') # or ...
# => 0.5
