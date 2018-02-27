class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.string :personality
      t.integer :zoo_id
      
      t.timestamps
    end
  end
end
