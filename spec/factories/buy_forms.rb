FactoryBot.define do
  factory :buy_form do
    postal_code      { "234-5678" }
    prefectures_id   { Faker::Number.between(from: 1, to: 47) }
    city             { "海" }
    house_number     { "太平洋" }
    building_name    { "名古屋港" }
    phone_number     { "09077778888" }

  end
end
