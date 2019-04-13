FactoryBot.define do
  factory :match_participation do
    association :match
    association :participant
    color { 'black' }
  end

  trait :white do
    color { 'white' }
  end
end
