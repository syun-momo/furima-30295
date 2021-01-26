class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :category_id

  end

  has_many :Users_items
  has_one :Address
  has_many :Users, through: :Users_items
  belongs_to_active_hash :category

  validates :category_id, numericality: { other_than: 1 }
end
