require 'rails_helper'

RSpec.describe MatchParticipation, type: :model do
  subject { build(:match_participation) }

  describe 'AR record validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a color' do
      subject.color = nil
      expect(subject).to be_invalid
    end

  end
end
