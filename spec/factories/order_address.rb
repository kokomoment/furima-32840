FactoryBot.define do
  factory :order_address do
    postcode      { '123-4567' }
    prefecture_id { 40 }
    city          { '高知市' }
    block         { '建物ハイツ' }
    building      { '1-1' }
    phone_number  { Faker::Number.leading_zero_number(digits: 11) }
    user_id       { 1 }
    item_id       { 1 }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
