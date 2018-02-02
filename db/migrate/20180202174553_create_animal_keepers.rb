class CreateAnimalKeepers < ActiveRecord::Migration[5.1]
  def change
    create_table :animal_keepers do |t|
      t.integer :animal_id
      t.keeper :keeper_id

      t.timestamps
    end
  end
end
