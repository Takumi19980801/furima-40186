FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birth_day             { Faker::Date.birthday(min_age: 18, max_age: 65).strftime('%Y-%m-%d') }
    first_name            { Faker::Japanese::Name.first_name }
    last_name             { Faker::Japanese::Name.last_name }
    kana_first_name       { Faker::Japanese::Name.first_name.yomi }
    kana_last_name        { Faker::Japanese::Name.last_name.yomi }
  end
end