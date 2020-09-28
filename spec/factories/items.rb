FactoryBot.define do
  factory :item do
    association :user

    item_name       {Faker::Games::Pokemon.name}
    item_text       {Faker::Food.fruits}
    category_id     {3}
    status_id       {3}
    delivery_fee_id {3}
    area_id         {3}
    day_id          {3}
    price           {1000}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end