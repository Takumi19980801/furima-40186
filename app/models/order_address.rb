class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street, :building_name, :phone_number, :user_id, :item_id, :token


  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)" }
    validates :city
    validates :street
    validates :token
    validates :phone_number, length: { minimum: 10, maximum: 11, message: "is too short" }
  end

  validates :phone_number, format: { with: /\A\d+\z/, message: "is invalid. Input only number" }
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street: street, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end