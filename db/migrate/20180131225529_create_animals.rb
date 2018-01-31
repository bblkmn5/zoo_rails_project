class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.string :gender
      t.string :personality
      t.boolean :hungry
      t.boolean :clean
      
      t.timestamps
    end
  end
end
