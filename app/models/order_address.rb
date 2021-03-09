class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :postcode
    validates :city
    validates :block
    validates :phone_number
    validates :token
  end

  validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly" }
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
  validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/, message: "Input only number"}

  def save
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number)
  end
end