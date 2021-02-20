FactoryBot.define do
  factory :item do
    product       { Faker::Lorem.word }
    explain       { Faker::Lorem.sentence }
    category_id   { Faker::Number.within(range: 2..10) }
    state_id      { Faker::Number.within(range: 2..7) }
    ship_fee_id   { Faker::Number.within(range: 2..3) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    ship_date_id  { Faker::Number.within(range: 2..4) }
    price         { Faker::Number.within(range: 300..9,999,999) }
  end
end
