module ShopqiApp
  class Engine < Rails::Engine
    isolate_namespace ShopqiApp

    config.generators do |g|                                                               
      g.template_engine :haml
      g.test_framework :rspec, :views => false
      g.integration_tool :rspec
    end


    initializer "shopqi_app.helpers" do
      ActiveSupport.on_load(:action_controller) do
        include ShopqiApp::Helpers
      end
    end
  end

end
