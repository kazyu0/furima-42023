require 'rails_helper'

RSpec.describe PurchaserDestination, type: :model do
  before do
    @purchaser_destination = FactoryBot.build(:purchaser_destination)
  end

  context '内容に問題ない場合' do
    it "tokenが空では登録できないこと" do
      @purchaser_destination.token = nil
      @purchaser_destination.valid?
      expect(@purchaser_destination.errors.full_messages).to include("Token can't be blank")
    end
  end
end