FactoryBot.define do
  factory :match do
    kifu { 'uploaded_kifu_url' }
    handicap { 4 }
    winner { 'black' }
    victory_condition { 'points' }
    association :location
    association :league
  end
end
