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

    it 'is not valid without email' do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Email can't be blank")
    end

    it 'is not valid without unique email' do
      User.create(first_name: "John", last_name: "Doe", email: "john@doe",
                        password: "password", password_confirmation: "password")
      subject.email = "JOHN@DOE"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Email has already been taken")
    end

    it 'is not valid with a password less than 8 characters' do
      subject.password = "pass"
      subject.password_confirmation = "pass"
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Password is too short (minimum is 8 characters)")
    end

    it 'is not valid without a first_name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("First name can't be blank")
    end

    it 'is not valid without a last_name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages[0]).to eql("Last name can't be blank")
    end
  end
end
