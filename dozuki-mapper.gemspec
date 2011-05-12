# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dozuki-mapper/version"

Gem::Specification.new do |s|
  s.name        = "dozuki-mapper"
  s.version     = Dozuki::Mapper::VERSION
  s.platform    = Gem::Platform::RUBY
  s.name        = "dozuki"
  s.version     = Dozuki::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["James Almond"]
  s.email       = ["james@jamesalmond.com"]
  s.homepage    = "https://github.com/jamesalmond/dozuki-mapper"
  s.summary     = %q{A DSL for mapping API output to object}
  s.description = %q{A DSL for mapping API output to object}

  s.rubyforge_project = "dozuki-mapper"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec,features}/* .autotest`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("dozuki")

  s.add_development_dependency("rspec")
  s.add_development_dependency("cucumber")
  s.add_development_dependency("autotest")
  s.add_development_dependency("rake")
end
