# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'site_prism/table/version'

Gem::Specification.new do |spec|
  spec.name          = "site_prism-table"
  spec.version       = SitePrism::Table::VERSION
  spec.authors       = ["André Aizim Kelmanson"]
  spec.email         = ["akelmanson@gmail.com"]

  spec.summary       = %q{Table scraping for SitePrism}
  spec.description   = %q{Table scraping for SitePrism}
  spec.homepage      = "https://github.com/investtools/site_prism-table"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "selenium-webdriver"
  spec.add_dependency "site_prism"
  spec.add_dependency "nokogiri"
end
