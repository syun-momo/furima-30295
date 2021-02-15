class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :address, :building, :phone_number, :user_item
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "-を使用してください" }
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: "半角数字を使用してください" }
  end
  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, user_item: user_item)
    Purchase.create(user_id: user_id, item_id: item_id)
  end
end 