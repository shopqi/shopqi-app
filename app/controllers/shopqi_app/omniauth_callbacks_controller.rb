module ShopQiApp
  class OmniauthCallbacksController < ApplicationController
    skip_before_filter :authenticate_shop!, only: :shopqi
    before_filter :assert_omniauth_auth

    def shopqi
      shop = Shop.find_for_shopqi_oauth(request.env["omniauth.auth"])
      sign_in_and_redirect shop
    end

    protected
    def assert_omniauth_auth
      unless request.env['omniauth.auth']
        flash[:error] = "Could not log in to store."
        redirect_to main_app.login_path
      end
    end

    def sign_in_and_redirect(shop)
      cookies.permanent[:shop_id] = shop.id
      redirect_to main_app.root_path
    end

  end
end
