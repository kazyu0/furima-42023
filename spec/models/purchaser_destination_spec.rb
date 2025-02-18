require 'rails_helper'

RSpec.describe PurchaserDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchaser_destination = FactoryBot.build(:purchaser_destination, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の入力' do
    context '正しい情報が入力されているとき' do
      it '全ての項目が正しく入力されていればバリデーションを通過する' do
        expect(@purchaser_destination).to be_valid
      end
    end

    context '郵便番号が無効な場合' do
      it '郵便番号が空では無効である' do
        @purchaser_destination.post_code = ''
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Post code is not a valid post code"
      end

      it '郵便番号が正しい形式でない場合、無効である' do
        @purchaser_destination.post_code = '1234567'
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Post code is not a valid post code"
      end
    end

    context '都道府県が無い場合' do
      it '都道府県が空では無効である' do
        @purchaser_destination.prefecture_id = ''
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Prefecture can't be blank"
      end
    end

    context '市区町村が無い場合' do
      it '市区町村が空では無効である' do
        @purchaser_destination.city = ''
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "City can't be blank"
      end
    end

    context '番地が無い場合' do
      it '番地が空では無効である' do
        @purchaser_destination.street_address = ''
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Street address can't be blank"
      end
    end

    context '電話番号が無効な場合' do
      it '電話番号が空では無効である' do
        @purchaser_destination.phone_number = ''
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Phone number can't be blank"
      end

      it '電話番号が無効な形式の場合、無効である' do
        @purchaser_destination.phone_number = '090-1234-5678'
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Phone number is not a valid post code"
      end

      it '電話番号が10桁未満または11桁以上の場合、無効である' do
        @purchaser_destination.phone_number = '1234567'
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Phone number is not a valid post code"

        @purchaser_destination.phone_number = '090123456789'
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Phone number is not a valid post code"
      end
    end

    context 'tokenが無い場合' do
      it 'tokenが空では無効である' do
        @purchaser_destination.token = nil
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Token can't be blank"
      end
    end

    context '建物名が空でも保存できる場合' do
      it '建物名が空でも保存できる' do
        @purchaser_destination.building_name = ''
        expect(@purchaser_destination).to be_valid
      end
    end

    context 'userとitemが紐付いていない場合' do
      it 'userが紐付いていないと保存できない' do
        @purchaser_destination.user_id = nil
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "User can't be blank"
      end

      it 'itemが紐付いていないと保存できない' do
        @purchaser_destination.item_id = nil
        @purchaser_destination.valid?
        expect(@purchaser_destination.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end