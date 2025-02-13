class OrderForm

  include ActiveModel::Model 
  attr_accessor :post_cord, :prefecture_id, :city, :street_address, :building_name, :phone_number, :purchaser, :item_id
  
  with_options presence: true do
    validates :purchaser
    validates :city
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :street_address
    validates :building_name
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :item_id
  end

  def save
    order = Order.create(purchaser_id: purchaser_id, item_id: item_id)
    Address.create(post_code: post_code, city_code: city_code, prefecture_id: prefecture_id, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  
  end
end