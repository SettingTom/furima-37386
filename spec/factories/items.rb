FactoryBot.define do
  factory :item do
    item_name       { Faker::Lorem.paragraph }
    price           { Faker::Number.between(from: 300, to: 9999999) }
    text            { Faker::Lorem.sentence }
    condition_id    { 2 }
    delivery_pay_id { 2 }
    delivery_day_id { 2 }
    area_id         { 2 }
    category_id     { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end