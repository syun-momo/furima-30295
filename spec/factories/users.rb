FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { '漢字' }
    first_name            { 'ひらがな' }
    family_name_kana      { 'カタカナ' }
    first_name_kana       { 'カタカナ' }
    birth_date            { '1900-01-01' }
  end
end
