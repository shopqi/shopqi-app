require "shopqi_app/engine"
require 'haml' # fixed haml: Missing template
require 'less-rails-bootstrap'
require 'omniauth'
require 'settingslogic'
require 'omniauth-shopqi'
require 'shopkit'

module ShopqiApp
  autoload :Helpers, "shopqi_app/helpers"
end
