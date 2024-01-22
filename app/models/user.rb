class User < ApplicationRecord
  validates :nickname,        presence: true
  validates :birth_day,       presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # 半角英数字混合での入力のみ許可
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: "is invalid. Include both letters and numbers." }

  with_options presence: true do
    # ひらがな、カタカナ、漢字のみ許可する
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    # カタカナのみ許可する
    validates :kana_first_name, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
    validates :kana_last_name, format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."}
  end

  has_many :items
  has_many :orders
end
