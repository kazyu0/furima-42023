class PurchaserDestination < ActiveRecord::Migration[7.1]
  def change
    create_table :purchaser_destinations do |t|
     

      t.timestamps
    end
  end
end
