require 'rails_helper'

RSpec.describe User, type: :model do
 before do
  @user = FactoryBot.build(:user)
end
  
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do 
      @user.email = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it '重複したメールアドレスが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end

    it 'メールアドレスは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end

    it 'パスワードが空では登録できない' do  
      @user.password = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'パスワードが6文字未満では登録できない' do
      @user.password = 'a1b2c'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)"
      
    end

    it 'パスワードが半角英数字混合でないと登録できない（数字のみ）' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password", "Password must include at least one letter and one digit"
      
    end

    it 'パスワードが半角英数字混合でないと登録できない（英字のみ）' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password", "Password must include at least one letter and one digit"
    end

    it 'パスワードとパスワード（確認）が一致しないと登録できない' do
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'お名前(全角)の名字が空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank", "Last name は全角文字（漢字・ひらがな・カタカナ）を使用してください"
    end

    it 'お名前(全角)の名前が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank", "First name は全角文字（漢字・ひらがな・カタカナ）を使用してください"
    end
    it 'お名前(全角)は漢字・ひらがな・カタカナ以外では登録できない' do
      @user.last_name = 'Smith'
      @user.first_name = 'John'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name は全角文字（漢字・ひらがな・カタカナ）を使用してください", "First name は全角文字（漢字・ひらがな・カタカナ）を使用してください"
    end

    it 'お名前カタカナ(全角)の名字が空では登録できない' do
      @user.last_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name katakana can't be blank", "Last name katakana は全角カタカナを使用してください"
    end

    it 'お名前カタカナ(全角)の名前が空では登録できない' do
      @user.first_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name katakana can't be blank", "First name katakana は全角カタカナを使用してください"
    end

    it 'お名前カタカナ(全角)はカタカナ以外では登録できない' do
      @user.last_name_katakana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name katakana は全角カタカナを使用してください"
    end

    it 'お名前カタカナ(全角)はカタカナ以外では登録できない' do
     @user.first_name_katakana = 'たろう'
     @user.valid?
      @user.valid?
      expect(@user.errors.full_messages).to include "First name katakana は全角カタカナを使用してください"
    end

    it '生年月日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end


