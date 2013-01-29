# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'regex_concat/version'

Gem::Specification.new do |gem|
  gem.name          = "regex_concat"
  gem.version       = RegexConcat::VERSION
  gem.authors       = ["Caius Durling"]
  gem.email         = ["dev@caius.name"]
  gem.description   = %q{Extends the Regexp class with a concat method, which lets you concatenate any number of regular expression objects together.}
  gem.summary       = %q{Concatenate regular expressions}
  gem.homepage      = "http://github.com/caius/regex_concat"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
end
