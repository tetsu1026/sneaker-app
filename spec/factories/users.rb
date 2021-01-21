FactoryBot.define do
  factory :user do
  email                     {Faker::Internet.free_email}
  password                  {"test1234"}
  password_confirmation     {password}
  profile                   {Faker::Lorem.sentence}
  nickname                  {Faker::Name}
  first_name                {"太郎"}
  last_name                 {"山田"}
  first_name_kana {"タロウ"}
  last_name_kana  {"ヤマダ"}
  birth_day    {"2020-1-20"}
  size_id    {5}
  
  end
end
