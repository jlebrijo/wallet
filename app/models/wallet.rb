class Wallet < ApplicationRecord
  belongs_to :wallatable, polymorphic: true
end
