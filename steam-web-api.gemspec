# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'steam/web/api/version'

Gem::Specification.new do |spec|
  spec.name          = 'steam-web-api'
  spec.version       = Steam::Web::Api::VERSION
  spec.authors       = ['Taylor Finnell']
  spec.email         = ['tmfinnell@gmail.com']
  spec.license       = 'MIT'

  spec.summary       = "Ruby interface to Valve's Web API"
  spec.description   = "Ruby interface to Valve's Web API"
  spec.homepage      = 'http://github.com/fastpeek/steam-web-api'

  spec.required_ruby_version = '>= 2.3'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'webmock', '~> 2.3'
  spec.add_development_dependency 'vcr', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.44.1'
  spec.add_development_dependency 'pry', '~> 0.10.4'
  spec.add_development_dependency 'dotenv', '~> 2.2'
end
