FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i)}
    password_confirmation {password}
    first_name            {Faker::Name.first_name(/\A[ぁ-んァ-ヶ一-龥々]+\z/)}
    last_name             {Faker::Name.last_name(/\A[ぁ-んァ-ヶ一-龥々]+\z/)}
    first_name_kana       {Faker::Name.name(/\A[ァ-ヶ]+\z/)}
    last_name_kana        {Faker::Name.name(/\A[ァ-ヶ]+\z/)}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}