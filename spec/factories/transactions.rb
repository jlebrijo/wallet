FactoryBot.define do
  factory :transaction do
    source_id { nil }
    target_id { nil }
    amount { 1.5 }
  end
end
