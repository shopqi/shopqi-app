require 'spec_helper'

describe ShopQiApp::OmniauthCallbacksController do

  let(:shop) { 'example.shopqi.com' }

  context '#shopqi' do # callback

    context 'with auth' do

      before do
        request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:shopqi]
      end

      it 'should be success' do
        get :shopqi, shop: shop, use_route: :shopqi_app
        response.should redirect_to('/')
      end

    end

    context 'without auth' do

      it 'should be fail' do
        get :shopqi, shop: shop, use_route: :shopqi_app
        response.should redirect_to('/login')
      end

    end

  end

end
