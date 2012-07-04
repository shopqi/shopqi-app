require 'spec_helper'

describe ShopQiApp::SessionsController do

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

  context '#shopqi_login' do

    context 'with session' do # 已登录

      before do
        session = mock('session')
        session.stub!(:[], 'shopqi').and_return({})
        controller.stub!(:session).and_return(session)
      end

      it 'should show dashboard' do # 直接显示后台管理
        get :shopqi_login, shop: shop, use_route: :shopqi_app
        response.should redirect_to('/')
      end

    end

    context 'without session' do # 未登录

      it 'should redirect to shopqi auth' do # 授权登录
        get :shopqi_login, shop: shop, use_route: :shopqi_app
        response.should redirect_to("/app/login?shop=#{shop}")
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
