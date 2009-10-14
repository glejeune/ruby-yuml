require 'rake'
require 'rake/clean'
require 'rake/gempackagetask'
require 'rake/rdoctask'
require 'rake/testtask'
require 'fileutils'
require './lib/yuml/version'
include FileUtils

NAME = "Ruby-yUML"
VERS = YUML::VERSION
CLEAN.include ['**/.*.sw?', '*.gem', '.config', 'test/test.log']
RDOC_OPTS = ['--quiet', '--title', "Ruby-yUML, the Documentation",
  "--opname", "index.html",
  "--line-numbers",
  "--main", "README.rdoc",
  "--inline-source"]

desc "Packages up Ruby-yUML."
task :default => [:package]
task :package => [:clean]

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

spec =
  Gem::Specification.new do |s|
    s.name = NAME
    s.version = VERS
    s.platform = Gem::Platform::RUBY
    s.has_rdoc = true
    s.extra_rdoc_files = ["README.rdoc", "AUTHORS", "COPYING",
      'lib/yuml.rb'] + Dir.glob( "lib/yuml/*.rb" )
    s.rdoc_options += RDOC_OPTS + ['--exclude', '^(examples|extras|test)\/']
    s.summary = "Ruby/yUML is a UML diagrams generator via yuml.me"
    s.description = s.summary
    s.author = "Grégoire Lejeune"
    s.email = 'gregoire.lejeune@free.fr'
    s.homepage = 'http://algorithmique.net'
    s.rubyforge_project = 'ruby-yuml'

    s.required_ruby_version = ">= 1.8.1"

    s.files = %w(COPYING README.rdoc AUTHORS setup.rb) + 
      Dir.glob("{bin,doc,test,lib,examples}/**/*").delete_if {|item| item.include?("CVS") or item.include?("._")}
       
    s.require_path = "lib"
        
    s.post_install_message = <<EOM
If For more information about Ruby/yUML, see 
  http://algorithmique.net

EOM
  end

Rake::GemPackageTask.new(spec) do |p|
  p.need_tar = true
  p.gem_spec = spec
end

task :install do
  sh %{rake package}
  sh %{sudo gem install pkg/#{NAME}-#{VERS}}
end

task :uninstall => [:clean] do
  sh %{sudo gem uninstall #{NAME}}
end
