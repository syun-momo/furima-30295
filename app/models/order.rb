class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :address

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
