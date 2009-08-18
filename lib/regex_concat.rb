module RegexpConcatenation
  # 
  # Concatenates Regexp objects together into a new Regexp object.
  # Keeps any flags, and adds them together. <tt>//i + //m == //im</tt>
  # 
  #   Regexp.concat(/foo/, /bar/) # => /foobar/
  #   Regexp.concat(/foo/i, /bar/) # => /foobar/i
  #   Regexp.concat(/foo/ix, /bar/m) # => /foobar/mix
  # 
  def concat(*regexes)
    allflags = regexes.inject(0) { |flags, re| flags | re.options }
    patterns = regexes.map { |re| re.source }
    Regexp.new(patterns.join, allflags)
  end
end

Regexp.send(:extend, RegexpConcatenation)
