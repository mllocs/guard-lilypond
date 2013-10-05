# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/lilypond/version'

Gem::Specification.new do |spec|
  spec.name          = 'guard-lilypond'
  spec.version       = Guard::LilypondVersion::VERSION
  spec.authors       = ['Maxim Colls']
  spec.email         = ['collsmaxim@gmail.com']
  spec.description   = %q{Guard plugin for Lilypond}
  spec.summary       = %q{Guard plugin for Lilypond}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'guard', '~> 1.8.3'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
