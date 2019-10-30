class User < ApplicationRecord
  has_one :wallet, as: :wallatable
  validates :name, presence: true

  after_create { create_wallet }
end
