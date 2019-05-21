require 'rails_helper'

RSpec.describe League, type: :model do
  subject { build(:league) }

  describe 'invalid conditions' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a director' do
      subject.director = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a start_date' do
      subject.start_date = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without an end_date' do
      subject.end_date = nil
      expect(subject).not_to be_valid
    end
  end
end
