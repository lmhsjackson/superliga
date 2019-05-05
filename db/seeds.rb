# Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |seed|
#   load seed
# end
load 'db/seeds/locations_seed.rb'
load 'db/seeds/leagues_seed.rb'
load 'db/seeds/players_seed.rb'
load 'db/seeds/participants_seed.rb'
load 'db/seeds/matches_seed.rb'

