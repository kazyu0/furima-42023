class Destinations < ActiveRecord::Migration[7.1]
  def change
    create_table :destinations do |t|
      t.references :purchaser, null: false, foreign_key: true
      t.integer :prefecture_id, null: false
      t.string :post_code, null: false
      t.string :city, null: false
      t.string :street_address, null: false
      t.string :building_name, null: false
      t.string :phone_number, null: false


      t.timestamps
  end
  end
end
