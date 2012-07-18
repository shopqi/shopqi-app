module ShopQiApp
  module ApplicationHelper
    def authenticate_shop! # 必须通过认证
      redirect_to main_app.root_path unless signed_in?
    end

    def signed_in?
      !current_shop.nil?
    end

    def current_shop
      @current_shop ||= (cookies.signed[:shop_id] && Shop.find_by_id(cookies.signed[:shop_id]))
    end

    def shop_url
      "http://#{current_shop.shopqi_domain}"
    end
  end
end
