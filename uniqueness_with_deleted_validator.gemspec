# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'uniqueness_with_deleted_validator'
  spec.version       = '1.1.0'
  spec.authors       = ['Kiril Dokh']
  spec.email         = ['dsounded@gmail.com']

  spec.summary       = 'Uniqueness With Deleted Validator'
  spec.description   = 'This gem is useful when you work with `paranoia` + `devise` gems etc, to prevent duplication creation (or unique index errors)'
  spec.homepage      = 'https://github.com/dsounded/uniqueness_with_deleted_validator'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency('activemodel', '>= 0')
  spec.add_dependency('i18n', '>= 0.1.0')

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry', '~> 0.10.4'
end
