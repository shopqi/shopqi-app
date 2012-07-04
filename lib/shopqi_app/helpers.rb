module ShopQiApp
  module Helpers
    def self.included(base)
      base.send :helper, ShopQiApp::ApplicationHelper
      base.send :include, ShopQiApp::ApplicationHelper
    end
  end
end
