FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '123abc' }
    password_confirmation { password }
    first_name            { '全角' }
    last_name             { '全角' }
    first_name_kana       { 'カタカナ' }
    last_name_kana        { 'カタカナ' }
    birthday              { Faker::Date.birthday }
  end
end
