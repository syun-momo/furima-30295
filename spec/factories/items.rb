FactoryBot.define do
  factory :item do
    # name {Faker::Name}
    name { Faker::Lorem.sentence }
    info { Faker::Lorem.sentence }
    price { 1000 }
    category_id { 2 }
    status_id { 2 }
    shopping_fee_status_id { 2 }
    prefectures_id { 2 }
    scheduled_delivery_id { 2 }
    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('spec/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
