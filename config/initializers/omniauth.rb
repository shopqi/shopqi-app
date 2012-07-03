Rails.application.config.middleware.use OmniAuth::Builder do
  provider :shopqi, 
    (SecretSetting.oauth.client_id rescue nil), # 调用 generator 时还没有 app_secret_config.yml 文件
    (SecretSetting.oauth.secret rescue nil),
    :scope => (SecretSetting.oauth.scope rescue nil),
    :callback_path => '/app/callback',
    :setup => lambda {|env| 
      params = Rack::Utils.parse_query(env['QUERY_STRING'])
      #site_url = "https://#{params['shop']}"
      site_url = "http://#{params['shop']}"
      Rails.logger.info(env['omniauth.strategy'])
      env['omniauth.strategy'].options[:client_options][:site] = site_url
    }
end

OmniAuth.config.on_failure{|env| raise env['omniauth.error']}
