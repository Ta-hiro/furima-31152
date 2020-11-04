FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    encrypted_password    {Faker::Internet.password(min_length: 6)}
    password_confirmation {encrypted_password}
    f_name                {Faker::Name.first_name}
    l_name                {Faker::Name.last_name}
    f_name_kana           {Faker::Name.first_kana_name}
    l_name_kana           {Faker::Name.last_kana_name}
    birthday              {Faker::Date.birthday}
  end
end