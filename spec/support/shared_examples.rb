RSpec.shared_examples 'a wallet owner' do
  it { should have_one :wallet }
  it 'wallet should not be nil' do
    expect(object.wallet).not_to be_nil
  end
end
