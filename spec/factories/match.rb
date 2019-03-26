FactoryBot.define do
  factory :match do
    kifu { 'uploaded_kifu_url' }
    handicap { 4 }
    winner { 'black' }
    victory_condition { 'points' }
    association :location
    association :league

    trait :with_participants do
      transient do
        participants { create_list(:participant, 2)}
      end

      before :create do |match, evaluator|
        match.participants = evaluator.participants
      end
    end
  end
end
