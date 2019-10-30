FactoryBot.define do
  factory :transaction do
    source factory: :wallet
    target factory: :wallet
    amount { 1.5 }
  end
end
