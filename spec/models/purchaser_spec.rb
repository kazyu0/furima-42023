require 'rails_helper'

RSpec.describe Purchaser, type: :model do
  let(:valid_attributes) { attributes_for(:purchaser_destination) }
 
  context "すべての属性が有効な場合" do
    it "有効な属性であればバリデーションを通過する" do
      purchaser_destination = PurchaserDestination.new(valid_attributes)
      purchaser = Purchaser.new(purchaser_destination: purchaser_destination)
      expect(purchaser_destination).to be_valid
    end
  end

  context "郵便番号が無効な場合" do
    it "郵便番号が空であれば無効である" do
      invalid_attributes = valid_attributes.merge(postal_code: "")
      purchaser_destination = PurchaserDestination.new(invalid_attributes)
      expect(purchaser_destination).not_to be_valid
      expect(purchaser_destination.errors[:postal_code]).to include("を入力してください")
    end

    it "郵便番号が正しい形式でない場合無効である" do
      invalid_attributes = valid_attributes.merge(postal_code: "1234567") # 無効な形式
      purchaser_destination = PurchaserDestination.new(invalid_attributes)
      expect(purchaser_destination).not_to be_valid
      expect(purchaser_destination.errors[:postal_code]).to include("郵便番号の形式が正しくありません")
    end
  end

  context "都道府県が無い場合" do
    it "都道府県が空であれば無効である" do
      invalid_attributes = valid_attributes.merge(prefecture: "")
      purchaser_destination = PurchaserDestination.new(invalid_attributes)
      expect(purchaser_destination).not_to be_valid
      expect(purchaser_destination.errors[:prefecture]).to include("を入力してください")
    end
  end

  context "市区町村が無い場合" do
    it "市区町村が空であれば無効である" do
      invalid_attributes = valid_attributes.merge(city: "")
      purchaser_destination = PurchaserDestination.new(invalid_attributes)
      expect(purchaser_destination).not_to be_valid
      expect(purchaser_destination.errors[:city]).to include("を入力してください")
    end
  end

  context "番地が無い場合" do
    it "番地が空であれば無効である" do
      invalid_attributes = valid_attributes.merge(street: "")
      purchaser_destination = PurchaserDestination.new(invalid_attributes)
      expect(purchaser_destination).not_to be_valid
      expect(purchaser_destination.errors[:street]).to include("を入力してください")
    end
  end

  context "電話番号が無効な場合" do
    it "電話番号が空であれば無効である" do
      invalid_attributes = valid_attributes.merge(phone_number: "")
      purchaser_destination = PurchaserDestination.new(invalid_attributes)
      expect(purchaser_destination).not_to be_valid
      expect(purchaser_destination.errors[:phone_number]).to include("を入力してください")
    end

    it "電話番号が無効な形式の場合、無効である" do
      invalid_attributes = valid_attributes.merge(phone_number: "090-1234-5678") # 無効な形式
      purchaser_destination = PurchaserDestination.new(invalid_attributes)
      expect(purchaser_destination).not_to be_valid
      expect(purchaser_destination.errors[:phone_number]).to include("電話番号の形式が正しくありません")
    end

    it "電話番号が10桁未満または11桁以上の場合、無効である" do
      invalid_attributes = valid_attributes.merge(phone_number: "1234567") # 無効な形式
      purchaser_destination = PurchaserDestination.new(invalid_attributes)
      expect(purchaser_destination).not_to be_valid
      expect(purchaser_destination.errors[:phone_number]).to include("電話番号は10桁または11桁で入力してください")
    end
  end
end
