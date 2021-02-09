FactoryBot.define do
  factory :item do
    name { 'sample' }
    info { 'sample' }
    price { 1000 }
    category_id { 2 }
    status_id { 2 }
    shopping_fee_status_id { 2 }
    prefecture_id { 2 }
    scheduled_delivery_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
