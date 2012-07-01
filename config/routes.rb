ShopqiApp::Engine.routes.draw do
  match 'login'        => 'sessions#new'
  get 'callback_login' => 'sessions#callback_login'  # 从 ShopQi 后台管理点击应用直接登录
  get 'callback'       => 'sessions#create',     :as => :callback
  get 'sign_out'       => 'sessions#destroy',    :as => :sign_out
end
