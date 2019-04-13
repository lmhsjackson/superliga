require 'rails_helper'

RSpec.describe Participant, type: :model do
  subject { build(:participant) }

  describe 'AR record validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a score' do
      subject.score = nil
      expect(subject).not_to be_valid
    end
  end
end
