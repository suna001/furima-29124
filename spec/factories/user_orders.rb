FactoryBot.define do
  factory :user_order do
        postal_code     {"123-4567"}
        area_id         {1}
        city            {"ああああ"}
        house_number    {"あああ12ー1"} 
        building_name   {"高田"}
        phone_number    { "09012344321" }
        token           {"tok_e0df02347bd389394efbfddcbfd3"}
        user_id         {1}
        item_id         {1}
  end
end
    