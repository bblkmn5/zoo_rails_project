class AddOmniauthToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :uid, :string
    add_index :users, :uid
    add_column :users, :provider, :string
    add_index :users, :provider
  end
end
