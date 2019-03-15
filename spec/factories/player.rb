FactoryBot.define do
  factory :player do
    name { 'Jose Piccioni' }
    sequence :email do |n|
      "player#{n}@example.com"
    end
    rango { "3K" }
  end
end
