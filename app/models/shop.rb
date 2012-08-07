class Shop < ActiveRecord::Base
  attr_accessible :shop_id, :name, :shopqi_domain

  def self.find_for_shopqi_oauth(data)
    shop_data = data.extra.raw_info.shop
    shop = where(shop_id: shop_data.id).first_or_create! name: shop_data.name, shopqi_domain: shop_data.shopqi_domain
    shop.access_token = data.credentials.token
    shop.tap(&:save)
  end

  def use_shopkit
    Shopkit.setup url: self.shopqi_domain, access_token: self.access_token
  end

  def admin_url # 后台
    "#{SecretSetting.shopqi_domain.protocol}#{self.shopqi_domain}/admin"
  end

  def front_url # 前台
    "http://#{self.shopqi_domain}"
  end
end
