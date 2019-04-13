FactoryBot.define do
  factory :player do
    first_name { 'Jose' }
    last_name { 'Piccioni' }
    sequence :email do |n|
      "player#{n}@example.com"
    end
    rank { "3K" }
  end
end
