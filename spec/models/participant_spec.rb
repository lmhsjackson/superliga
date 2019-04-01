require 'rails_helper'

RSpec.describe Participant, type: :model do
  describe '.new_from' do
    it 'copies the players attributes' do
      player = build :player
      participant = Participant.new_from(player)
      [:first_name, :last_name, :rank].each do |attr|
      expect(send(participant, :attr)).to eq(send(player, attr))
      end
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
