FactoryBot.define do
  factory :league do
    name { 'Superliga' }
    edition { "Febrero 2019" }
    start_date { Date.today }
    end_date { Date.today + 1.month }
  end
end
