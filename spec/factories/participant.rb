FactoryBot.define do
  factory :participant do
    score { 0 }
    association :league
    association :player
  end
end
