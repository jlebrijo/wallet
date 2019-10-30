class Transaction < ApplicationRecord
  has_one :source, class_name: 'Wallet', foreign_key: :id, primary_key: :source_id
  has_one :target, class_name: 'Wallet', foreign_key: :id, primary_key: :target_id
  validates :amount, presence: true
end
