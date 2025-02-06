require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = FactoryBot.build(:user) 
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)  
      user.email = '' 
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it '重複したメールアドレスが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      expect(another_user).not_to be_valid
    end

    it 'メールアドレスは@を含まないと登録できない' do
      @user.email = 'testmail.com'
      expect(@user).not_to be_valid
    end

    it 'パスワードが空では登録できない' do
      @user.password = ''
      expect(@user).not_to be_valid
    end

    it 'パスワードが6文字未満では登録できない' do
      @user.password = 'a1b2c'
      @user.password_confirmation = 'a1b2c'
      expect(@user).not_to be_valid
    end

    it 'パスワードが半角英数字混合でないと登録できない（数字のみ）' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user).not_to be_valid
    end

    it 'パスワードが半角英数字混合でないと登録できない（英字のみ）' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      expect(@user).not_to be_valid
    end

    it 'パスワードとパスワード（確認）が一致しないと登録できない' do
      @user.password_confirmation = 'different'
      expect(@user).not_to be_valid
    end

    it 'お名前(全角)の名字が空では登録できない' do
      @user.last_name = ''
      expect(@user).not_to be_valid
    end

    it 'お名前(全角)の名前が空では登録できない' do
      @user.first_name = ''
      expect(@user).not_to be_valid
    end

    it 'お名前(全角)は漢字・ひらがな・カタカナ以外では登録できない' do
      @user.last_name = 'Smith'
      @user.first_name = 'John'
      expect(@user).not_to be_valid
    end

    it 'お名前カナ(全角)の名字が空では登録できない' do
      @user.last_name_kana = ''
      expect(@user).not_to be_valid
    end

    it 'お名前カナ(全角)の名前が空では登録できない' do
      @user.first_name_kana = ''
      expect(@user).not_to be_valid
    end

    it 'お名前カナ(全角)はカタカナ以外では登録できない' do
      @user.last_name_kana = 'やまだ'
      @user.first_name_kana = 'たろう'
      expect(@user).not_to be_valid
    end

    it '生年月日が空では登録できない' do
      @user.birth_date = ''
      expect(@user).not_to be_valid
    end
  end
end
end

  pending "add some examples to (or delete) #{__FILE__}"
end
