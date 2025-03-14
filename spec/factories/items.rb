FactoryBot.define do
  factory :item do
  name { "商品名" }
  description { "商品の説明" }
  price { 500 }
  category_id { 2 }
  condition_id { 2 }
  shipping_fee_burden_id { 2 }
  prefecture_id { 2 }
  delivery_day_id { 2 }
  
  
  association :user

  after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
  end
end