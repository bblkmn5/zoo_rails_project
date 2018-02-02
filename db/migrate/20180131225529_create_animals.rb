class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.string :personality
      t.integer :keepers_needed
      t.integer :zoo_id
      t.datetime :last_fed
      t.datetime :last_cleaned
      
      t.timestamps
    end
  end
end
