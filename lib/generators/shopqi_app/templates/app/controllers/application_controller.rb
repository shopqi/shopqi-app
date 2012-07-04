class ApplicationController < ActionController::Base
  protect_from_forgery
  prepend_before_filter :authenticate_shop!
end
