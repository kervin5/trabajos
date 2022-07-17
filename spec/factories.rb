FactoryBot.define do
  factory :location do
    name { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
  end

  factory :user do
    # Use sequence to make sure that the value is unique
    sequence(:email) { |n| "user-#{n}@example.com" }
  end

  factory :job do
    sequence(:title) { |n| "item-#{n}" }
    user
  end
end
