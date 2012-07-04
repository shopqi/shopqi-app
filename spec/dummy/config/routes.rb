Rails.application.routes.draw do
  mount ShopQiApp::Engine => "/app"
  root to: 'home#index'
end
