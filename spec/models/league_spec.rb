require 'rails_helper'

RSpec.describe League, type: :model do
  subject { build(:league) }

  describe '#players' do
    it 'gets all the players from it\'s matches' do
      league = create :league
      2.times { league.matches << match_with_players }
      expect(league.players).not_to eq []
      expect(league.players.map(&:email).uniq.count).to eq 4
    end
  end

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

  def match_with_players
    build(:match,
          white_player: build(:player),
          black_player: build(:player))
  end
end
