# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yuml/version'


RDOC_OPTS = ['--quiet', '--title', "Ruby-yUML, the Documentation",
  "--opname", "index.html",
  "--line-numbers",
  "--main", "README.rdoc",
  "--inline-source"]

Gem::Specification.new do |gem|
  gem.name          = "ruby-yuml"
  gem.version       = YUML::VERSION
  gem.authors       = ["Grégoire Lejeune"]
  gem.email         = ["gregoire.lejeune@free.fr"]
  gem.summary       = %q{Ruby/yUML is a UML diagrams generator via yuml.me}
  gem.description   = gem.summary
  gem.homepage      = "http://algorithmique.net"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.has_rdoc      = true
  gem.extra_rdoc_files = ["README.rdoc", "AUTHORS", "COPYING",
    'lib/yuml.rb'] + Dir.glob( "lib/yuml/*.rb" )
  gem.rdoc_options += RDOC_OPTS + ['--exclude', '^(examples|extras|test)\/']
  gem.rubyforge_project = 'ruby-yuml'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rdoc'
end