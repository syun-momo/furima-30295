FactoryBot.define do
  factory :user_order do
    postal_code { '111-1111' }
    prefecture_id { 2 }
    city { '札幌市' }
    address { '西区' }
    building { 'エスポワール' }
    phone_number { 11111112222 }
    token { 'tokentokentoken' }
    user_id { 1 }
    item_id { 2 }
  end
end
