class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname, :birthday, presence: true
  with_options presence: true do
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  end


end
