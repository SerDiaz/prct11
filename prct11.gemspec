lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prct09/version'

Gem::Specification.new do |spec|

  spec.authors       = ["Sergio Diaz", "Ivan Garcia"]
  spec.email         = ["alu0100696615@ull.edu.es", "alu0100693737@ull.edu.es"]
  spec.description   = %q{Gestion de matrices densas y dispersas.}
  spec.summary       = %q{}
  spec.homepage      = "https://github.com/alu0100693737/prct11"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.name          = "prct11"
  spec.version       = Prct09::VERSION

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
end

