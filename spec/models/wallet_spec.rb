describe Wallet, type: :model do
  it { should belong_to(:wallatable) }
  it { should have_many :source_transactions }
  it { should have_many :target_transactions }

  let(:wallet) { create :wallet }

  describe 'balance: calculates sum of a wallet' do
    it 'zero if no transactions' do
      expect(wallet.balance).to be_zero
    end
    it 'target_transactions minus source_transactions' do
      create :transaction, amount: 1000, target_id: wallet.id
      create :transaction, amount: 700, source_id: wallet.id

      expect(wallet.balance).to eq 300
    end
  end

  it 'deposit: adds money from outside the system' do
    wallet.deposit 1000
    expect(wallet.balance).to eq 1000
  end

  it 'withdraw: sends money to outside the system' do
    wallet.deposit 1000
    wallet.withdraw 300
    expect(wallet.balance).to eq 700
  end

  it 'transfer: sends money to other wallet in the system' do
    wallet.deposit 1000
    w2 = create :wallet
    wallet.transfer_to w2, amount: 300
    expect(wallet.balance).to eq 700
    expect(w2.balance).to eq 300
  end
end
