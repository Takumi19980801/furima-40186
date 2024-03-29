class Item < ApplicationRecord
  validates :image,   presence: true
  validates :name,    presence: true
  validates :message, presence: true
  validates :price,   presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'is not a number'}

  validates :category_id, numericality:             { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality:            { other_than: 1 , message: "can't be blank"}
  validates :shipping_cost_burden_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality:           { other_than: 1 , message: "can't be blank"}
  validates :day_to_ship_id, numericality:          { other_than: 1 , message: "can't be blank"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_cost_burden
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :day_to_ship

  belongs_to :user
  has_one_attached :image
  has_one    :order

end
