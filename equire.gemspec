
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'equire/version'

Gem::Specification.new do |spec|
  spec.name          = 'equire'
  spec.version       = Equire::VERSION
  spec.authors       = ['Masataka Pocke Kuwabara']
  spec.email         = ['kuwabara@pocke.me']

  spec.summary       = 'You can forget `require`.'
  spec.description   = 'You can forget `require`.'
  spec.homepage      = 'https://github.com/pocke/equire'
  spec.license       = 'Apache-2.0'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
end
