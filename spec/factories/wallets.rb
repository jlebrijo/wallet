FactoryBot.define do
  factory :wallet do
    # association :wallatable, factory: :user

    trait :with_balance do
      after(:create) { |wallet| wallet.deposit 1000 }
    end
  end
end
