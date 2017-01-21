FactoryGirl.define do
  factory :message do
    text { Faker::Lorem.sentence }
  end

  factory :empty_message, class: Message do
    text nil
  end
end
