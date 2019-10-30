describe User, type: :model do
  it { should have_one :wallet }
  it { should validate_presence_of :name }
end
