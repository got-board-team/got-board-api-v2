RSpec.shared_examples :trackable do
  it { is_expected.to belong_to(:game) }
  it { is_expected.to have_many(:houses) }
end
