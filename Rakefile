require 'rake/clean'
# require 'rubygems/package_task'
require 'rdoc/task'
require 'rake/testtask'

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks
RSpec::Core::RakeTask.new(:spec)
CLOBBER.include('pkg', 'doc', '**/*.o')

# task :default => [:package]
task :default => :spec

task :doc => [:rdoc, :after_doc]

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

task :after_doc do
  sh %{scp -r doc/rdoc/* #{ENV['USER']}@rubyforge.org:/var/www/gforge-projects/ruby-yuml/}
end
