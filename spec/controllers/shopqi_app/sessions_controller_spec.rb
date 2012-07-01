require 'spec_helper'

describe ShopqiApp::SessionsController do

  let(:shop) { 'example.shopqi.com' }
  
  context '#new' do

    it 'should be show' do
      get :new, use_route: :shopqi_app
      response.should be_success
    end

    it 'should be login' do
      post :new, shop: shop, use_route: :shopqi_app
      response.should be_redirect
    end

  end

  context '#create' do # callback

    context 'with auth' do

      before do
        request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:shopqi]
      end

      it 'should be success' do
        get :create, shop: shop, use_route: :shopqi_app
        response.should redirect_to('/')
      end

    end

    context 'without auth' do

      it 'should be fail' do
        get :create, shop: shop, use_route: :shopqi_app
        response.should redirect_to('/app/login')
      end

    end

  end

end
