require 'rails_helper'

RSpec.describe Player, type: :model do
  subject { build(:player) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a correct email format' do
    subject.email = 'notAmail.com'
    expect(subject).not_to be_valid
  end

  it 'is not valid without a correct rank' do
    subject.rank = '14D'
    expect(subject).not_to be_valid
  end

  describe '#full_name' do
    it 'combines first and last name' do
      subject.first_name = 'Phil'
      subject.last_name = 'Collins'
      expect(subject.full_name).to eq('Phil Collins')
    end
  end
end
