module ShopqiApp
  class ApplicationController < ActionController::Base
    protect_from_forgery

    protected
    def authenticate_shop! # 必须通过认证
      redirect_to root_path unless signed_in?
    end

    def signed_in?
      session[:shopqi]
    end

  end
end
