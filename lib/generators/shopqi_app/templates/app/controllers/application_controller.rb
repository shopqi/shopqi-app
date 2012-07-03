class ApplicationController < ActionController::Base
  protect_from_forgery
  helper ShopqiApp::ApplicationHelper
  include ShopqiApp::ApplicationHelper
  prepend_before_filter :authenticate_shop!
end
