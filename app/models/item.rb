class Item < ApplicationRecord

  validates :category_id, :state_id, :ship_fee_id, :prefecture_id, :ship_date_id, numericality: { other_than: 1 }
  with_options presence: true do
    validates :product
    validates :explain
    validates :category_id
    validates :state_id
    validates :ship_fee_id
    validates :prefecture_id
    validates :ship_date_id
    validates :price
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :ship_fee
  belongs_to :prefecture
  belongs_to :ship_date
end
