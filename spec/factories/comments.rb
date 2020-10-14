FactoryBot.define do
  factory :comment do
    association :user
    association :item

    text    {"コメントします"}
  end
end
