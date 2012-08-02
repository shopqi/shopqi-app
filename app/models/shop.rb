class Shop < ActiveRecord::Base
  attr_accessible :shop_id, :name, :shopqi_domain, :access_token

  def self.find_for_shopqi_oauth(data)
    shop_data = data.extra.raw_info.shop
    shop = where(shop_id: shop_data.id).first_or_create! name: shop_data.name, shopqi_domain: shop_data.shopqi_domain
    shop.access_token = data.credentials.token
    shop.tap(&:save)
  end
end
