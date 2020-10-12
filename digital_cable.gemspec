require File.expand_path("../lib/digital_cable/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name = "digital_cable"
  gem.license = "MIT"
  gem.version = DigitalCable::VERSION
  gem.authors = ["Chuck Collins"]
  gem.email = ["chuck.collins@gmail.com"]
  gem.homepage = "https://github.com/ccollins/digital-cable"
  gem.summary = "Out-of-Band Server Triggered DOM Operations"

  gem.files = Dir["lib/**/*.rb", "bin/*", "[A-Z]*"]
  gem.test_files = Dir["spec/**/*.rb"]

  gem.add_dependency "rails", ">= 5.2"

  gem.add_development_dependency "github_changelog_generator"
  gem.add_development_dependency "magic_frozen_string_literal"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "pry-nav"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "standardrb"
  gem.add_development_dependency "rspec"
end
