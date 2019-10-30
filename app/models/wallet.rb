class Wallet < ApplicationRecord
  belongs_to :wallatable, polymorphic: true
  has_many :source_transactions, class_name: 'Transaction', foreign_key: :source_id
  has_many :target_transactions, class_name: 'Transaction', foreign_key: :target_id
end
