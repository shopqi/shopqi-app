$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shopqi_app/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shopqi-app"
  s.version     = ShopqiApp::VERSION
  s.authors     = ["saberma"]
  s.email       = ["mahb45@gmail.com"]
  s.homepage    = "https://github.com/saberma/shopqi-app"
  s.summary     = "ShopQi app engine."
  s.description = s.summary

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.1.6"
  s.add_dependency "omniauth-shopqi", "~> 0.1.0"
  s.add_dependency "shopkit", "~> 0.1.0"
  s.add_dependency "haml", "~> 3.1.6"

  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails", "~> 2.10.1"
  #s.add_development_dependency "factory_girl_rails", "~> 3.5.0"
end