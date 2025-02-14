class Purchaser < ActiveRecord::Migration[7.1]
  def change
    create_table :purchasers do |t|

      t.timestamps
  end
end
end