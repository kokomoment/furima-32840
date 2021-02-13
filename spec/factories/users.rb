FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {'abc123'}
    password_confirmation {password}
    first_name            {'全角'}
    last_name             {'全角'}
    first_name_kana       {'カタカナ'}
    last_name_kana        {'カタカナ'}
    birthday              {Faker::Date.birthday}
  end
end