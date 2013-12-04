# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coffeelint_rails/railtie'

Gem::Specification.new do |spec|
  spec.name          = 'coffeelint-rails'
  spec.version       = CoffeelintRails::Railtie::VERSION
  spec.authors       = ['Matthew Eagar']
  spec.email         = ['me@meagar.net']
  spec.description   = %q{Coffeelint integration for Rails}
  spec.summary       = %q{Coffeelint integration for Rails}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'coffeelint', '~> 0.1.0'
  spec.add_dependency 'rails', '~> 4.0.0'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
