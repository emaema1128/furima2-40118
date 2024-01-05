FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.email }
    password { "a1" + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { Faker::Name.first_name }
    last_name {  Faker::Name.last_name }
    first_name_kana { "タナカ" }
    last_name_kana {  "タロウ" }
    birthday { Faker::Date.birthday }
  end
end