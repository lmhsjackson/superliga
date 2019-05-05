require 'rails_helper'

RSpec.describe Participant, type: :model do
  subject { build(:participant) }

  describe '#update_score' do
    let(:won_games) { build_list(:match_participation, 3, :won) }
    let(:lost_games) { build_list(:match_participation, 3) }

    it 'adds 3 points per won game' do
      subject.match_participations << won_games
      subject.update_score
      expect(subject.score).to eq(9)
    end

    it 'adds 1 point per lost game' do
      subject.match_participations << lost_games
      subject.update_score
      expect(subject.score).to eq(3)
    end

    it 'counts both lost and won games' do
      subject.match_participations << lost_games + won_games
      subject.update_score
      expect(subject.score).to eq(12)
    end
  end

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
