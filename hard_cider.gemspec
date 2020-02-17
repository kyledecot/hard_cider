# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hard_cider/version'

Gem::Specification.new do |spec|
  spec.name          = 'hard_cider'
  spec.version       = HardCider::VERSION
  spec.authors       = ['Kyle Decot']
  spec.email         = ['kyle.decot@icloud.com']

  spec.summary       = 'Wait for your IPAs to be Processed'
  spec.description   = 'Wait for your IPAs to be Processed'
  spec.homepage      = 'https://github.com/kyledecot/hard_cider'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'pry', '~> 0.12.2'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.79.0'
  spec.add_development_dependency 'simplecov', '~> 0.16.1'
  spec.add_development_dependency 'webmock', '~> 3.6.0'

  spec.add_runtime_dependency 'app_store_connect', '0.19.0'
  spec.add_runtime_dependency 'gli', '~> 2.19.0'
end
