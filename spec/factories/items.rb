FactoryBot.define do
  factory :item do
    product_name        { Faker::Artist.name }
    explanation         { Faker::Food.dish }
    category_id         { Faker::Number.between(from: 1, to: 9) }
    product_status_id   { Faker::Number.between(from: 1, to: 6) }
    delivery_burden_id  { Faker::Number.between(from: 1, to: 2) }
    prefectures_id      { Faker::Number.between(from: 1, to: 47) }
    shipping_period_id  { Faker::Number.between(from: 1, to: 3) }
    price               { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/test_images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
# , content_type: 'image/jpg'
