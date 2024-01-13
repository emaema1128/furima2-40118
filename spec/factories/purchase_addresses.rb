FactoryBot.define do
  factory :purchase_address do
    token { "tok_abcdefghijk00000000000000000" }
    postalcode { '123-4567' }
    prefecture_id { "3" }
    city { '横浜市緑区' }
    block { '青山1-1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
  end
end
