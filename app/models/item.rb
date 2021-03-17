class Item < ApplicationRecord
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :state_id
    validates :ship_fee_id
    validates :prefecture_id
    validates :ship_date_id
  end

  with_options presence: true do
    validates :product
    validates :explain
    validates :price
    validates :image
  end

  validates :price, inclusion: { in: 300..9_999_999, message: 'Out of settintg range' },
                    numericality: { only_integer: true, message: 'Half-width number' }

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :ship_fee
  belongs_to :prefecture
  belongs_to :ship_date
end
