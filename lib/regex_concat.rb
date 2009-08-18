module RegexpConcatenation
  # 
  # Concatenates Regexp objects together into a new Regexp object.
  # Keeps any flags, and adds them together. <tt>//i + //m == //im</tt>
  # 
  #   Regexp.concat(/foo/, /bar/) # => /foobar/
  #   Regexp.concat(/foo/i, /bar/) # => /foobar/i
  #   Regexp.concat(/foo/ix, /bar/m) # => /foobar/mix
  # 
  def concat *regexes
    # We need somewhere to store the flags from each regex
    @flags = ""
    # Run through the regexes in a map!
    regexes.map! do |regex|
      # Separate out the flags and the actual regex itself
      flags, str = regex.to_s.scan(/(?:^\(\?(m?i?x?)-?m?i?x?:(.*?)\)$)/).first
      # Add the flags to our store
      @flags += flags
      # And map this element to just the regex str
      str
    end
    # Run through the flags, strip any duplicates
    # and then convert them into the numerical counterpart
    @flags = @flags.split("").uniq.inject(0) do |sum, flag|
      sum += case flag
      when "i"
        1
      when "x"
        2
      when "m"
        4
      else
        0
      end
    end
    # Get rid of the instance variable
    f = @flags; @flags = nil;
    # And return a Regexp object created from the regex strings
    # complete with any flags we need specified.
    Regexp.new(regexes.join(""), f)
  end
end

Regexp.send(:extend, RegexpConcatenation)
