module ShopqiApp
  module Helpers
    def self.included(base)
      base.send :helper, ShopqiApp::ApplicationHelper
      base.send :include, ShopqiApp::ApplicationHelper
    end
  end
end
