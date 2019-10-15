require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to have_secure_password }
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :email }

    it { is_expected.to validate_confirmation_of :password }

    subject { build(:user, email: 'email@email.com') }
    it { is_expected.to validate_uniqueness_of :email }

    it 'is expected valid emails' do
      user = build(:user, :invalid_email)
      user.valid?
      expect(user.errors.messages.include?(:email)).to be_truthy
    end
  end
end
