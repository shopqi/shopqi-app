Rails.application.routes.draw do
  use_shopqi
  root :to => 'home#index'
end
