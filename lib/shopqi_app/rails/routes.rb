module ShopQiApp
  module Rails
    class Routes
      module Helper
        def use_shopqi(options = {}, &block)
          options.reverse_merge! callbacks: 'shopqi_app/omniauth_callbacks'
          self.match 'login' => "shopqi_app/sessions#new"
          self.get 'callback_login' => "shopqi_app/sessions#shopqi_login" # 从 ShopQi 后台管理点击应用直接登录
          self.get 'callback' => "#{options[:callbacks]}#shopqi"
          self.get 'sign_out' => "shopqi_app/sessions#destroy"
        end
      end

      def self.install
        ActionDispatch::Routing::Mapper.send :include, ShopQiApp::Rails::Routes::Helper
      end
    end
  end
end
