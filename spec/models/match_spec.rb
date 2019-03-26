require 'rails_helper'

RSpec.describe Match, type: :model do

  subject { build(:match) }

  describe 'AR record validations' do

    before do
      allow(subject).to receive(:participants).and_return(["fake", "participants"])
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a location' do
      subject.location = nil
      expect(subject).not_to be_valid
    end

    # Victory conditions are a fixed set specified in the model.
    it 'is not valid with a weird victory condition' do
      subject.victory_condition = 'This is not valid'
      expect(subject).not_to be_valid
    end

    it 'is not valid without a league' do
      subject.league = nil
      expect(subject).not_to be_valid
    end
  end

  describe 'participants validations' do
    it 'is not valid without 2 participants' do
      subject.participants = []
      expect(subject).not_to be_valid
    end

    it 'is not valid if white and black player are the same' do
      participant = build :participant
      subject.participants << [participant, participant]
      expect(subject).not_to be_valid
    end
  end
end
