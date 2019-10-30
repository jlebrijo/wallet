class Transaction < ApplicationRecord
  has_one :source, class_name: 'Wallet', foreign_key: :id, primary_key: :source_id
  has_one :target, class_name: 'Wallet', foreign_key: :id, primary_key: :target_id

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validate :amount_less_or_equal_than_actual_blance

  def kind
    return 'deposit' if source.nil?
    return 'withdraw' if target.nil?
    'transfer'
  end

  def amount_less_or_equal_than_actual_blance
    if source && (source.balance < amount)
      errors.add :amount, 'should be minor or equal to source wallet actual balance'
    end
  end
end
