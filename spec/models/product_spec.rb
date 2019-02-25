require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:category) { Category.new(:name => "Example Category") }
  subject {
    described_class.new(name: "Example", price: 100, quantity: 10, category: category)
  }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
