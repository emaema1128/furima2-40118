FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.email }
    password { "a1" + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { "田中" }
    last_name { "太郎" }
    first_name_kana { "タナカ" }
    last_name_kana {  "タロウ" }
    birthday { Faker::Date.birthday }
  end
end