module ShopQiApp
  class Engine < Rails::Engine
    isolate_namespace ShopQiApp
    engine_name 'shopqi_app'

    config.generators do |g|                                                               
      g.template_engine :haml
      g.test_framework :rspec, :views => false
      g.integration_tool :rspec
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
  end

end
