class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :zoo_id
      t.string :password_digest
      t.string :email

      t.timestamps
    end
  end
end
