module ShopQiApp
  module ApplicationHelper
    def authenticate_shop! # 必须通过认证
      redirect_to main_app.root_path unless signed_in?
    end

    def signed_in?
      session[:shopqi]
    end

    def current_shop
      session[:shopqi] && session[:shopqi][:shop]
    end

    def shop_url
      "http://#{current_shop['shopqi_domain']}"
    end
  end
end
