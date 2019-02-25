require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(first_name: "Peter", last_name: "Nolan", email: "example@example.com",
                        password: "password", password_confirmation: "password")
  }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
      expect(subject.errors.full_messages.length).to eql(0)
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Password can't be blank")
    end

    it 'is not valid without a password_confirmation' do
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Password confirmation can't be blank")
    end

    it 'is not valid when password and password_confirmation do not match' do
      subject.password_confirmation = "somethingelse"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Password confirmation doesn't match Password")
    end
  end
end
