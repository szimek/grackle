require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = %q{grackle}
    gem.description = %q{Grackle is a lightweight library for the Twitter REST and Search API.}
    gem.summary = %q{Grackle is a library for the Twitter REST and Search API designed to not require a new release in the face Twitter API changes or errors. It supports both basic and OAuth authentication mechanisms.}
    gem.email = %q{hayes@appozite.com}
    gem.homepage = %q{http://github.com/hayesdavis/grackle}
    gem.authors = ["Hayes Davis"]
    
    gem.add_runtime_dependency('json', '>= 0')
    gem.add_dependency('mime-types', '>= 0')
    gem.add_dependency('oauth', '>= 0')

    gem.rdoc_options = ["--inline-source", "--charset=UTF-8"]
    
    gem.rubyforge_project = %q{grackle}
  end

rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end


task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "test #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

