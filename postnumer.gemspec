# frozen_string_literal: true

require_relative 'lib/postnumer'

Gem::Specification.new do |spec|
  spec.name = 'postnumer'
  spec.version = Postnumer::VERSION
  spec.authors = ['Alda Vigdís Skarphéðinsdóttir']
  spec.email = ['aldavigdis@aldavigdis.is']

  spec.summary = 'Validate and use Icelandic postal codes.'
  spec.homepage = 'https://github.com/aldavigdis/postnumer-gem'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/aldavigdis/postnumer-gem'
  spec.metadata['changelog_uri'] = 'https://github.com/aldavigdis/postnumer-gem'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem

  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.21'

  spec.add_development_dependency 'actionview', '~> 7.0'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end
