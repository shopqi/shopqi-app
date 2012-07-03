# ShopQi App Engine

集成访问 ShopQi API 的功能，支持以 ShopQi 用户身份登录

## 安装

    $ echo "gem 'shopqi-app'" >> Gemfile
    $ bundle

## 使用

    $ rails g shopqi_app client_id client_secret

`client_id`, `client_secret` 在注册 Application 后显示，注册时 `REDIRECT URI` 填写 localhost:3000/app/callback

## 配置

如需修改 scope, 请打开 `config/app_secret_config.yml`

    defaults: &defaults
      oauth:
        client_id: 'dffd069fa92096022628a1f7eb174bc85d90278b8c90ec7ebadfbd94924bd2b8'
        secret: 'e1805141c81c496e4779371f41263c9f74ac2ffd3728302296b8af10b64d9c9b'
        scope: 'read_products read_orders'
        redirect_uri: 'http://localhost:3000/app/callback'

## 最后

启动应用服务

    $ rails s

访问 [http://localhost:3000](http://localhost:3000)
