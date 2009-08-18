require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Regexp, "concat" do

  it "should respond to the method" do
    Regexp.should respond_to(:concat)
  end

  it "should concat two regexps" do
    Regexp.concat(/foo/, /bar/).should == /foobar/
  end
  
  it "should concat three regexps" do
    Regexp.concat(/foo/, /bar/, /sed/).should == /foobarsed/
  end
  
  4.upto(10) do |i|
    instance_eval <<-EOF
      it "should concat #{i} regexps" do
        regexps = []
        #{i}.times {
          regexps << /foo/
        }
        str = "foo" * #{i}

        Regexp.concat(*regexps).should == /\#{str}/
      end
    EOF
  end
  
  it "should concat a lot of regexps" do
    regexps = []
    5000.times {
      regexps << /foo/
    }
    str = "foo" * 5000
    
    Regexp.concat(*regexps).should == /#{str}/
  end
  
  describe "flags" do
    
    it "should keep a flag on one of the regexes" do
      Regexp.concat(/foo/i, /bar/).should == /foobar/i
    end
    
    it "should concat two flags on two of the regexes" do
      Regexp.concat(/foo/i, /bar/m).should == /foobar/im
    end
    
  end
  
end
