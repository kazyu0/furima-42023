class PurchaserDestination 

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street_address, :building_name, :phone_number, :user_id, :item_id, :purchaser_id

  with_options presence: true do
    validates :purchaser_id
    validates :city
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is not a valid postal code" }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :street_address
    
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is not a valid postal code" }
    validates :item_id
  #validates :token
  end

  def save
    purchaser = Purchaser.create(purchaser_id: purchaser_id, item_id: item_id, amount: amount)
    Destination.create(post_code: post_code, city_code: city_code, prefecture_id: prefecture_id, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  
  end
end