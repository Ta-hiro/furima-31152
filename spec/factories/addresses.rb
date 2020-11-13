FactoryBot.define do
  factory :address do
    postal_code      { "234-5678" }
    prefectures_id   { Faker::Number.between(from: 1, to: 47) }
    city             { "海" }
    house_number     { "太平洋" }
    building_name    { "名古屋港" }
    phone_number     { 12345678901 }
  end
end
