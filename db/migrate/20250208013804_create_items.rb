class CreateItems < ActiveRecord::Migration[7.1]
  def change
      create_table :items do |t|
        t.references :user, null: false, foreign_key: true
        t.integer :category_id, null: false
        t.text :item_description, null: false
        t.integer :item_condition_id, null: false
        t.integer :shipping_fee_burden_id, null: false
        t.integer :price, null: false
        t.integer :prefecture_id, null: false
        t.integer :delivery_day_id, null: false
        t.string :name, null: false
  
        t.timestamps
      end
    end
  end

