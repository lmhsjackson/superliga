require 'rails_helper'

RSpec.describe Match, type: :model do
  describe 'AR record validations' do
    subject { build(:match) }

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

  describe 'participants methods' do
    subject { create(:match, :with_participants) }
    describe '#winner' do
      it 'gets the participant who won the match' do
        winner = subject.match_participations.find_by(winner: true).participant
        expect(subject.winner).to eq(winner)
      end
    end

    describe '#white_participant' do
      it 'gets the white participant' do
        white_participant = subject.match_participations
                                   .find_by(color: 'white').participant
        expect(subject.white_participant).to eq(white_participant)
      end
    end

    describe '#black_participant' do
      it 'gets the black participant' do
        black_participant = subject.match_participations
                                   .find_by(color: 'black').participant
        expect(subject.black_participant).to eq(black_participant)
      end
    end
  end
end
