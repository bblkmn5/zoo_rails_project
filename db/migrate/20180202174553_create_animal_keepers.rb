class CreateAnimalKeepers < ActiveRecord::Migration[5.1]
  def change
    create_table :animal_keepers do |t|
      t.integer :animal_id
      t.integer :keeper_id
      t.integer :user_id

      t.timestamps
    end
  end
end
