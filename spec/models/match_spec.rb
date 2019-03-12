require 'rails_helper'

RSpec.describe Match, type: :model do

  subject { build(:match) }

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

  it 'is not valid with weird victory condition' do
    subject.victory_condition = 'This is not valid'
    expect(subject).not_to be_valid
  end
end
