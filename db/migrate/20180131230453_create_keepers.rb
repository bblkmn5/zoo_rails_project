class CreateKeepers < ActiveRecord::Migration[5.1]
  def change
    create_table :keepers do |t|
      t.string :name
      t.integer :zoo_id
      
      t.timestamps
    end
  end
end
