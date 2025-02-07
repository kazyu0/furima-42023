class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'must include at least one letter and one digit' }

  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角文字（漢字・ひらがな・カタカナ）を使用してください' }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角文字（漢字・ひらがな・カタカナ）を使用してください' }
  validates :last_name_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナを使用してください' }
  validates :first_name_katakana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナを使用してください' }
  validates :birthday, presence: true
end
