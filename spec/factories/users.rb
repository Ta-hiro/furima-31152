
FactoryBot.define do
  factory :user do
    nickname               {"サバ太郎"}
    email                  {"sabat@saba"}
    password               {"sabasaba11"}
    password_confirmation  {"sabasaba11"}
    f_name                 {"サバ"}
    l_name                 {"太郎"}
    f_name_kana            {"サバ"}
    l_name_kana            {"タロウ"}
    birthday               {Faker::Date.birthday}
  end
end
=begin
    nickname               {Faker::Name.name}
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    f_name                 {Faker::Name.first_name}
    l_name                 {Faker::Name.last_name}
    f_name_kana            {Faker::Name.}
    l_name_kana            {Faker::Name.}
    birthday               {Faker::Date.birthday} 
=end