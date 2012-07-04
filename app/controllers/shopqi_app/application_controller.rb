module ShopQiApp
  class ApplicationController < ActionController::Base
    include ApplicationHelper
    protect_from_forgery
    layout 'application' # 使用 main_app 的 layout
  end
end
