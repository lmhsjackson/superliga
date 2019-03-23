require 'rails_helper'

RSpec.describe Participant, type: :model do
  describe '.new_from' do
    it 'copies the players attributes' do
      player = build :player
      participant = Participant.new_from(player)
      expect(participant.first_name).to eq(player.first_name)
      expect(participant.last_name).to eq(player.last_name)
      expect(participant.rank).to eq(player.rango)
    end

    it 'initializes the score to 0' do
      player = build :player
      participant = Participant.new_from(player)
      expect(participant.score).to eq(0)
    end

    context 'with a different_rank for this league' do
      it 'does not clone the players rank' do
        
      end
    end
  end

end
