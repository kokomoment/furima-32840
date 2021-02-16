class Item < ApplicationRecord

  validates :category_id, :state_id, :ship_fee_id, :prefecture_id, :ship_date_id, numericality: { other_than: 1 }

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :ship_fee
  belongs_to :prefecture
  belongs_to :ship_date
end
