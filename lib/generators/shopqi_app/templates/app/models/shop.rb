require "#{ShopQiApp::Engine.models_dir}/shop"
class Shop
  attr_accessible :shop_id, :name, :shopqi_domain, :access_token
end
