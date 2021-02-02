class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :images

  with_options presence: true do
    validates :images
    validates :name
    validates :info
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :shopping_fee_status_id
    validates :prefectures_id
    validates :scheduled_delivery_id
  end

  validates :name, length: { maximum: 40 }
  validates :info, length: { maximum: 1000 }
  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  has_many :Users_items
  has_one :Address
  has_many :Users, through: :Users_items
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shopping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  belongs_to :user
end
