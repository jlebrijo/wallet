FactoryBot.define do
  factory :wallet do
    association :wallatable, factory: :user
  end
end
