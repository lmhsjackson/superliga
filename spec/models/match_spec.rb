require 'rails_helper'

RSpec.describe Match, type: :model do

  let(:black_player) { build :player }
  let(:white_player) { build :player }
  let(:location) { build :location }
  let(:league) { build :league }
  subject { described_class.new location: location, league: league, black_player: black_player, white_player: white_player  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a location' do
    subject.location = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a league' do
    subject.league = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a white_player' do
    subject.white_player = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a black_player' do
    subject.black_player = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid if white and black player are the same' do
    subject.black_player = subject.white_player
    expect(subject).not_to be_valid
  end
end
