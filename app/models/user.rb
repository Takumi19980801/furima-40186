class User < ApplicationRecord
  validates :nickname,        presence: true
  validates :first_name,      presence: true
  validates :last_name,       presence: true
  validates :kana_first_name, presence: true
  validates :kana_last_name,  presence: true
  validates :birth_day,       presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
