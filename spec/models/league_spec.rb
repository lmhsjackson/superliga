require 'rails_helper'

RSpec.describe League, type: :model do
  subject { build(:league) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a director' do
    subject.director = nil
    expect(subject).not_to be_valid
  end
end
