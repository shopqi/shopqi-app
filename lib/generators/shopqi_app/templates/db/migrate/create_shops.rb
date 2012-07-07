class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :shop_id     , unique: true, null: false
      t.string :name         , limit: 32   , null: false
      t.string :shopqi_domain, limit: 64   , null: false
      t.string :access_token , limit: 64
    end
    add_index :shops, :shop_id, :unique => true
  end
end
