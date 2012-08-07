require "#{ShopQiApp::Engine.models_dir}/shop" # methods: use_shopkit admin_url front_url
class Shop
  attr_accessible :shop_id, :name, :shopqi_domain
end
