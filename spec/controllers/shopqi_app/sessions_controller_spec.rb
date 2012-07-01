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

end
