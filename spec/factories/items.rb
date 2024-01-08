FactoryBot.define do
  factory :item do
    title          {"hoge"}
    explain        {Faker::Lorem.sentence}
    category_id    {1}
    freight_id     {1}
    shipping_id    {1}
    prefecture_id  {13}
    shipdate_id    {1}
    price          {"9999"}

    association :user 

     # 1枚の画像をアップロードする
    
      after(:build) do |item|
        item.image.attach(io: File.open('spec/images/orange.png'), filename: 'orange.png')
      end

  end
end
