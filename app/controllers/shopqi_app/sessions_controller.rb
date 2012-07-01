module ShopqiApp
  class SessionsController < ApplicationController

    def new
      if params[:shop].present?
        redirect_to "/auth/shopqi?shop=#{params[:shop].to_s.strip}"
      end
    end

    def create
      if data = request.env['omniauth.auth']
        session[:shopqi] = { 
          url: params[:shop],
          access_token: data['credentials']['token'],
          shop: data['extra']['raw_info']['shop']
        }
        redirect_to main_app.root_path
      else
        flash[:error] = "Could not log in to store."
        redirect_to login_path
      end
    end

    def shopqi_login
      if signed_in?
        redirect_to main_app.root_path
      else
        redirect_to login_path(shop: params[:shop])
      end
    end

    def destroy
      session[:shopqi] = nil
      redirect_to root_path
    end

  end
end
