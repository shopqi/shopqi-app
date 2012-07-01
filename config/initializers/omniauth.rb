Rails.application.config.middleware.use OmniAuth::Builder do
  provider :shopqi, 
    SecretSetting.oauth.client_id, 
    SecretSetting.oauth.secret,
    :scope => SecretSetting.oauth.scope,
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
