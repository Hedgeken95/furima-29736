FactoryBot.define do
  factory :order_address do
    
    postcode      {"123-4567"}
    prefecture_id {5}
    city          {"横浜市西区みなとみらい"}
    block         {"2-1"}
    phone_number  {1234567890}
    token         {"sampleToken"}
  end
end
  