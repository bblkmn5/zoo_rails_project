class CreateZoos < ActiveRecord::Migration[5.1]
  def change
    create_table :zoos do |t|
      t.string :name
      t.integer :animal_capacity
      t.integer :keeper_capacity
      t.integer :animal_id
      t.integer :keeper_id
      t.integer :user_id

      t.timestamps
    end
  end
end
