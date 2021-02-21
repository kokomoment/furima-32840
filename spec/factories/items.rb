FactoryBot.define do
  factory :item do
    product       { Faker::Lorem.word }
    explain       { Faker::Lorem.sentence }
    category      { Category.find(2) }
    state         { State.find(2) }
    ship_fee      { ShipFee.find(2) }
    prefecture    { Prefecture.find(2) }
    ship_date     { ShipDate.find(2) }
    price         { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
