FactoryBot.define do
  factory :item do
    name              {"財布"}                 
    price             {10000}                 
    description       {"ああああああ"}                
    category_id       { 1 }                
    condition_id      { 1 }               
    area_id           { 1 }               
    delivery_fee_id   { 1 }              
    shipping_day_id   { 1 } 

    association :user

    after(:build) do |img|
      img.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    # user
    # after(:build) do |item|
    #   item.images.attach(io: File.open('spec/fixtures/test_image.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
  end
end
