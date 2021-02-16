class Item < ApplicationRecord

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :ship_fee
  belongs_to :prefecture
  belongs_to :ship_date
end
