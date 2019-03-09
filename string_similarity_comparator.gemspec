# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'string_similarity_comparator/version'

Gem::Specification.new do |spec|
  spec.name          = 'string_similarity_comparator'
  spec.version       = StringSimilarityComparator::VERSION
  spec.authors       = ['Coralie Collignon']
  spec.email         = ['coralie.collignon@gmail.com']

  spec.summary       = 'Compare algorithms for string similarity calculations'
  spec.description   = 'This gem aggregates the value of different string similarity algorithms to help select the most appropriate'
  spec.homepage      = "https://github.com/coralieco/string_similarity_comparator"
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'amatch', '~> 0.4.0'
  spec.add_development_dependency 'trigram', '~> 0.0.1'
  spec.add_development_dependency 'string-similarity', '~> 2.0'
  spec.add_development_dependency 'sinatra', '~> 2.0'
end
