describe Transaction, type: :model do
  it { should have_one :source }
  it { should have_one :target }
  it { should validate_presence_of :amount }

  it 'should connect source/target with wallet' do
    ws = create :wallet
    wt = create :wallet
    t = create :transaction, source_id: ws.id, target_id: wt.id

    expect(t.source).to eq ws
    expect(t.target).to eq wt
    expect(ws.source_transactions).to include t
    expect(wt.target_transactions).to include t
  end

  it 'source/target can be nil' do
    t = create :transaction, source_id: nil, target_id: nil

    expect(t.source).to be_nil
    expect(t.target).to be_nil
  end

  it 'kind: returns transaction type deposit/withdraw/transfer' do
    w1 = create :wallet
    w2 = create :wallet
    t = create :transaction, source_id: w1.id, target_id: w2.id
    expect(t.kind).to eq 'transfer'
    t = create :transaction, source_id: nil, target_id: w2.id
    expect(t.kind).to eq 'deposit'
    t = create :transaction, source_id: w1.id, target_id: nil
    expect(t.kind).to eq 'withdraw'
  end
end
