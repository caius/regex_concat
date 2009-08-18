# regex-concat

Extends the Regexp class with a concat method, which lets you concatenate any number of regular expression objects together.

If the regular expressions have any options (flags) set, then it adds together all the flags and sets the lot on the resulting regex.

## Usage

	require "rubygems"
	require "regex_concat"
	
	a = /foo/
	b = /bar/m
	c = /(sed)/i
	
	Regexp.concat(a, b, c) # => /foobar(sed)/mi

## Installation

	$ gem install caius-regex_concat --source=http://gems.github.com/

## Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## License

Copyright (c) 2009 Caius Durling. See LICENSE for details.
