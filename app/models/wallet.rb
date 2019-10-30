class Wallet < ApplicationRecord
  belongs_to :wallatable, polymorphic: true
  has_many :source_transactions, class_name: 'Transaction', foreign_key: :source_id
  has_many :target_transactions, class_name: 'Transaction', foreign_key: :target_id

  def balance
    return 0 unless target_transactions.any?
    target_transactions.pluck(:amount).sum - source_transactions.pluck(:amount).sum
  end
end
