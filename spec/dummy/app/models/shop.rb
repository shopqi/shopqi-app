class Shop < ActiveRecord::Base
  attr_accessible :shop_id, :name, :shopqi_domain, :access_token

  def self.find_for_shopqi_oauth(data)
    shop = data.extra.raw_info.shop
    where(shop_id: shop.id).first_or_create! name: shop.name, shopqi_domain: shop.shopqi_domain, access_token: data.credentials.token
  end

end
