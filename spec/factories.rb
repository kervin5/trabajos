FactoryBot.define do
  factory :user do
    # Use sequence to make sure that the value is unique
    sequence(:email) { |n| "user-#{n}@example.com" }
  end

  factory :job do
    sequence(:title) { |n| "item-#{n}" }
    user
  end
end
