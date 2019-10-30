describe Wallet, type: :model do
  it { should belong_to(:wallatable) }
  it { should have_many :source_transactions }
  it { should have_many :target_transactions }
end
