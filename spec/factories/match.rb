FactoryBot.define do
  factory :match do
    kifu { 'uploaded_kifu_url' }
    handicap { 4 }
    victory_condition { 'points' }
    association :location
    association :league
  end

  trait :with_participants do
    after(:create) do |match, _evaluator|
      match.match_participations << create(:match_participation)
      match.match_participations << create(:match_participation, :white, :won)
    end
  end
end
