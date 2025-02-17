FactoryBot.define do
  factory :purchaser_destination do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '渋谷区' }
    street_address { '渋谷1-1-1' }
    building_name { '渋谷ビル' }
    phone_number { '09012345678' } 
    token {"tok_abcdefghijk00000000000000000"}

    association :user 
    association :item 
  end
end
