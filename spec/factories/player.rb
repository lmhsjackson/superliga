FactoryBot.define do
  factory :player do
    first_name { 'Jose' }
    last_name { 'Piccioni' }
    sequence :email do |n|
      "player#{n}@example.com"
    end
    rango { "3K" }
  end
end
