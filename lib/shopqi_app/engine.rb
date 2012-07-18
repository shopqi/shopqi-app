module ShopQiApp
  class Engine < Rails::Engine
    isolate_namespace ShopQiApp
    engine_name 'shopqi_app'

    def models_dir
      root.join 'app', 'models'
    end

    config.generators do |g|                                                               
      g.template_engine :haml
      g.test_framework :rspec, :views => false
      g.integration_tool :rspec
    end

    initializer "shopqi_app.routes" do
      ShopQiApp::Rails::Routes.install
    end

    initializer "shopqi_app.acronym" do
      ActiveSupport::Inflector.inflections do |inflect|
        inflect.acronym 'ShopQi'
      end
    end

    initializer "shopqi_app.helpers" do
      ActiveSupport.on_load(:action_controller) do
        include ShopQiApp::Helpers
      end
    end

    initializer "shopqi_app.omniauth" do |app|
      app.middleware.use OmniAuth::Builder do
        provider :shopqi,
          (SecretSetting.oauth.client_id rescue nil), # 调用 generator 时还没有 app_secret_config.yml 文件
          (SecretSetting.oauth.secret rescue nil),
          :scope => (SecretSetting.oauth.scope rescue nil),
          :callback_path => (SecretSetting.oauth.callback_path rescue nil),
          :setup => lambda {|env|
            params = Rack::Utils.parse_query(env['QUERY_STRING'])
            #site_url = "https://#{params['shop']}"
            site_url = "http://#{params['shop']}"
            env['omniauth.strategy'].options[:client_options][:site] = site_url
          }
      end

      OmniAuth.config.on_failure{|env| raise env['omniauth.error']}
    end
  end
end
