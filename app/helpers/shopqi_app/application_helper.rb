module ShopQiApp
  module ApplicationHelper
    def authenticate_shop! # 必须通过认证
      redirect_to main_app.root_path unless signed_in?
    end

    def signed_in?
      !cookies[:shop_id].blank?
    end

    def current_shop
      @current_shop ||= (signed_in? && Shop.find(cookies[:shop_id]))
    end

    def shop_url
      "http://#{current_shop.shopqi_domain}"
    end
  end
end
