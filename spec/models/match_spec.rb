require 'rails_helper'

RSpec.describe Match, type: :model do

  subject { build(:match) }

  describe 'AR record validations' do
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
end
