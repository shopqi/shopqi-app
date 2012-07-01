module ShopqiApp
  class Engine < Rails::Engine
    isolate_namespace ShopqiApp

    config.generators do |g|                                                               
      g.template_engine :haml
      g.test_framework :rspec, :views => false
      g.integration_tool :rspec
    end

  end
end
