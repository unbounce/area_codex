# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'area_codes/version'

Gem::Specification.new do |gem|
  gem.name          = "area_codes"
  gem.version       = AreaCodes::VERSION
  gem.authors       = ["Chris Cummer"]
  gem.email         = ["chris@unbounce.com"]
  gem.description   = %q{Phone number area code lookup by region.}
  gem.summary       = %q{A list of phone number area codes by country. Currently only supports Canada, the United States, and Mexico.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'shoulda'
end
