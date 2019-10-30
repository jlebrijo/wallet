describe Wallet, type: :model do
  it { should belong_to(:wallatable) }
  it { should have_many :source_transactions }
  it { should have_many :target_transactions }

  describe '#balance: calculates sum of a wallet' do
    let(:wallet) { create :wallet }

    it 'zero if no transactions' do
      expect(wallet.balance).to be_zero
    end
    it 'target_transactions minus source_transactions' do
      create :transaction, amount: 1000, target_id: wallet.id
      create :transaction, amount: 700, source_id: wallet.id

      expect(wallet.balance).to eq 300
    end
  end
end
