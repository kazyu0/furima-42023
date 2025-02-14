FactoryBot.define do
  factory :purchaser_destination do
    postal_code { '123-4567' }
    prefecture { '東京都' }
    city { '渋谷区' }
    street { '渋谷1-1-1' }
    building { '渋谷ビル' }
    phone_number { '09012345678' }
  end
end
