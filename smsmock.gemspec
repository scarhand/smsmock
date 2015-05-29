lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Maintain your gem's version:
require 'smsmock/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'smsmock'
  s.version     = SmsMock::VERSION
  s.authors     = ['Niels van der Zanden']
  s.email       = ['niels@pharynx.nl']
  s.homepage    = 'https://github.com/scarhand/smsmock'
  s.summary     = 'Sms mocker for twilio-ruby.'
  s.description = 'Sms mocker for twilio-ruby.'

  s.files = Dir["{lib}/**/*"] + ['smsmock.gemspec','README.md']

  s.add_dependency 'rspec'
  s.add_development_dependency 'twilio-ruby'
end