require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "regex_concat"
    gem.summary = %Q{Concatenate regular expressions}
    gem.description = %Q{Extends the Regexp class with a concat method, which lets you concatenate any number of regular expression objects together.}
    gem.email = "dev@caius.name"
    gem.homepage = "http://github.com/caius/regex_concat"
    gem.authors = ["Caius Durling"]
  end

rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install technicalpickles-jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end




task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "regex_concat #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
