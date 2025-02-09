require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(name: "商品名", item_description: "商品の説明", price: 500, category_id: 2, condition_id: 2, shipping_fee_burden_id: 2, prefecture_id: 2, delivery_day_id: 2)
  end

  describe '商品出品' do
  context '商品が出品できる場合' do
    it '全ての項目が正しく入力されていれば出品できる' do
      expect(@item).to be_valid
    end
  end

  context '商品が出品できない場合' do

    it '画像がなければ出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
   
    it 'userと紐づいていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it '商品名が空では出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が空では出品できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'カテゴリーの情報が空では出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態についての情報が空では出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it '配送料の負担についての情報が空では出品できない' do
      @item.shipping_fee_burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
    end

    it '発送元の地域についての情報が空では出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '発送までの日数についての情報が空では出品できない' do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day can't be blank")
    end

    it '価格が空では出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が300未満では出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price は300円から9,999,999円の間で設定してください")
    end

    it '価格が10,000,000以上では出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price は300円から9,999,999円の間で設定してください")
    end

    it '価格が半角数値でなければ出品できない' do
      @item.price = '三百'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price は300円から9,999,999円の間で設定してください")
    end
  end
 end
end

