require 'rails/generators/active_record'

class ShopQiAppGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  namespace 'shopqi_app'
  source_root File.expand_path('../templates', __FILE__)

  argument :client_id    , type: :string, required: true
  argument :client_secret, type: :string, required: true

  def copy_files
    directory 'app'
    template 'config/app_secret_config.yml.erb', 'config/app_secret_config.yml'
  end

  def remove_files
    remove_file 'public/index.html'
    remove_file 'app/assets/javascripts/application.js'
    remove_file 'app/assets/stylesheets/application.css'
    remove_file 'app/views/layouts/application.html.erb'
  end

  def add_routes
    route "use_shopqi"
    route "root :to => 'home#index'"
  end

  def install_migration
    migration_template 'db/migrate/create_shops.rb', 'db/migrate/create_shops.rb'
  end

  def show
    readme "README"
  end

  def self.next_migration_number(dirname)
    ActiveRecord::Generators::Base.next_migration_number(dirname)
  end
end
