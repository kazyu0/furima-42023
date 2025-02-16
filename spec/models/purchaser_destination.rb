class PurchaserDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'は「3桁-4桁」の形式で入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' } # 「---」が 1 の場合
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁または11桁の半角数字で入力してください' }
    validates :purchaser
    validates :item_id
    validates :token
    validates :building_name
  end
end