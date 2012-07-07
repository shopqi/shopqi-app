require "shopqi_app/engine"
require 'haml' # fixed haml: Missing template
require 'less-rails-bootstrap'
require 'omniauth'
require 'settingslogic'
require 'omniauth-shopqi'
require 'shopkit'

module ShopQiApp
  autoload :Helpers, "shopqi_app/helpers"

  module Rails
    autoload :Routes, "shopqi_app/rails/routes"
  end
end
