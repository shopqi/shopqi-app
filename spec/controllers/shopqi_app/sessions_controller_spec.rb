require 'spec_helper'

describe ShopQiApp::SessionsController do

  let(:shop) { 'example.shopqi.com' }

  context '#new' do

    it 'should be show' do
      get :new
      response.should be_success
    end

    it 'should be login' do
      post :new, shop: shop
      response.should be_redirect
    end

  end

  context '#shopqi_login' do

    context 'with cookies' do # 已登录

      before do
        cookies = mock('cookies')
        cookies.stub!(:signed).and_return({shop_id: 1})
        controller.stub!(:cookies).and_return(cookies)
      end

      it 'should show dashboard' do # 直接显示后台管理
        get :shopqi_login, shop: shop
        response.should redirect_to('/')
      end

    end

    context 'without cookies' do # 未登录

      it 'should redirect to shopqi auth' do # 授权登录
        get :shopqi_login, shop: shop
        response.should redirect_to("/login?shop=#{shop}")
      end

    end


  end

  context '#destroy' do

    it 'should be success' do
      put :destroy, use_route: :shopqi_app
      response.should redirect_to("/")
    end

  end

end
