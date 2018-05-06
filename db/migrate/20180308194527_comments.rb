class Comments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
        t.string :notes
        t.integer :animal_id
    end
  end
end
