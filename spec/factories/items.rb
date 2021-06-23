FactoryBot.define do
  factory :item do
    association :user
    
    name {'商品名'}
    description {'商品の説明'}
    category_id {2}
    product_status_id {2}
    delivery_charge_id {2}
    area_id {2}
    shopping_day_id {2}
    price {300}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image2.png'), filename: 'test_image2.png')
    end
  end
end
