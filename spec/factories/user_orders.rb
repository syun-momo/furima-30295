FactoryBot.define do
  factory :user_order do
    postal_code { '111-1111' }
    prefecture_id { 2 }
    city { '札幌市' }
    address { '西区' }
    building { 'エスポワール' }
    phone_number { '08011112222' }
    token { 'tokentokentoken' }
    association    :item
    association    :user
  end
end
