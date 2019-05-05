FactoryBot.define do
  factory :match do
    kifu { 'uploaded_kifu_url' }
    handicap { 4 }
    victory_condition { 'points' }
    association :location
    association :league
  end
end
