require_relative 'lib/wordexp/version'

Gem::Specification.new do |spec|
  spec.name = 'wordexp'
  spec.version = Wordexp::VERSION
  spec.authors = ['Sami Samhuri']
  spec.email = ['sami@samhuri.net']

  spec.summary = 'A Ruby gem for performing shell word expansion using wordexp'
  spec.homepage = 'https://github.com/samsonjs/wordexp'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/samsonjs/wordexp/issues',
    'changelog_uri' => 'https://github.com/samsonjs/wordexp/releases',
    'source_code_uri' => 'https://github.com/samsonjs/wordexp',
    'homepage_uri' => spec.homepage,
    'rubygems_mfa_required' => 'true',
  }

  # Specify which files should be added to the gem when it is released.
  glob = %w[LICENSE.txt README.md lib/**/* ext/extconf.rb ext/wordexp_ext.c]
  spec.files = Dir.glob(glob).reject { |f| File.directory?(f) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = %w[ext lib]
end
