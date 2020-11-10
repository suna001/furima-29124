FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"111111a"}
    password_confirmation {password}
    first_name            {"あああ"}
    last_name             {"あああ"}
    first_name_kana       {"アアア"}
    last_name_kana        {"アアア"}
    birthday              {Faker::Date.birthday}
  end
end