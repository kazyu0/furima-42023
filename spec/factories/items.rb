FactoryBot.define do
  factory :item do
    name { "商品名" }
    item_description  { "商品の説明" }
    price { 500 }
    category_id { 2 }
    item_condition_id { 2 }
    shipping_fee_burden_id { 2 }
    prefecture_id { 2 }
    delivery_day_id { 2 }
  end
end
