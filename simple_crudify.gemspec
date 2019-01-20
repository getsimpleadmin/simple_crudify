lib = File.expand_path('../lib', __FILE__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'simple_crudify/version'

Gem::Specification.new do |spec|
  spec.name          = 'simple_crudify'
  spec.version       = SimpleCrudify::VERSION
  spec.authors       = ['Dmitriy Strukov']
  spec.email         = ['dmitiry_strukov2011@mail.ru']

  spec.summary       = 'simple_crudify'
  spec.description   = 'simple_crudify'
  spec.homepage      = 'https://github.com/getsimpleadmin/simple_crudify'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake',    '~> 10.0'
end
