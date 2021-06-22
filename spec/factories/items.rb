FactoryBot.define do
  factory :item do
    name {'商品名'}
    description {'商品の説明'}
    category_id {1}
    product_status_id {1}
    delivery_charge_id {1}
    area_id {1}
    shopping_day_id {1}
    price {'販売価格'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image2.png'), filename: 'test_image2.png')
    end
  end
end
