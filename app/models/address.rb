class Address < ApplicationRecord
  with_options presence: true do
    validates :postcode
    validates :city
    validates :block
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  belongs_to :order
end
