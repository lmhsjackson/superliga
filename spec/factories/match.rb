FactoryBot.define do
  factory :match do
    kifu { 'uploaded_kifu_url' }
    handicap { 4 }
    winner { 'black' }
    victory_condition { 'points' }
    association :black_player, factory: :player
    association :white_player, factory: :player
    association :location
    association :league
  end
end
