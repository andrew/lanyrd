# -*- encoding: utf-8 -*-
require File.expand_path('../lib/lanyrd/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrew Nesbitt"]
  gem.email         = ["andrewnez@gmail.com"]
  gem.description   = %q{Ruby wrapper for the Lanyrd API}
  gem.summary       = %q{Ruby wrapper for the Lanyrd API}
  gem.homepage      = "http://github.com/andrew/lanyrd"

  gem.add_dependency 'faraday_middleware',  '~> 0.9'
  gem.add_dependency 'hashie',              '~> 2.0.3'

  # Ruby 1.8 doesn't include JSON in the std lib
  if RUBY_VERSION < "1.9"
    gem.add_dependency 'json',            '>= 1.7.5'
  end

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'bundler',     '~> 1.0'
  gem.add_development_dependency 'rspec',       '~> 2.6'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "lanyrd"
  gem.require_paths = ["lib"]
  gem.version       = Lanyrd::VERSION
end
