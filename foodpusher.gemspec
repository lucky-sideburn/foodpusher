$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')
require 'foodpusher/version'

Gem::Specification.new do |s|
  s.name = 'foodpusher'
  s.version = Foodpusher::VERSION
  s.platform = Gem::Platform::RUBY
  s.extra_rdoc_files = ['README.md']
  s.summary = 'Control Push Jobs for Chef Server'
  s.description = s.summary
  s.author = 'Eugenio Marzo'
  s.email = 'eugenio.marzo@sourcesense.com'
  s.homepage = 'https://github.com/lucky-sideburn/foodpusher'
  s.license = 'Apache-2.0'
  s.require_path = 'lib'
  s.files = %w[README.md] + Dir.glob('lib/**/*')
end
