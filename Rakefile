require 'rake/clean'
require 'rdoc/task'
require 'rake/testtask'

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
CLOBBER.include('pkg', 'doc', '**/*.o')

# task :default => [:package]
task :default => :spec

task :doc => [:rdoc]

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'doc/rdoc'
  rdoc.options += RDOC_OPTS
  rdoc.main = "README.rdoc"
  rdoc.title = "Ruby/yUML, the Documentation"
  rdoc.rdoc_files.add [
    'README.rdoc', 
    'AUTHORS', 
    'COPYING',
    'lib/yuml.rb'
  ] + Dir.glob( "lib/yuml/*.rb" )
end

