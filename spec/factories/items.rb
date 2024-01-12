FactoryBot.define do
  factory :item do
    name                    { '魚' }
    message                 { 'カタクチ' }
    price                   { 1000 }
    category_id             { 2 }
    condition_id            { 2 }
    shipping_cost_burden_id { 2 }
    prefecture_id           { 2 }
    day_to_ship_id          { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
