class Match < ApplicationRecord
  belongs_to :location
  belongs_to :league
  belongs_to :black_player, class_name: 'Player'
  belongs_to :white_player, class_name: 'Player'
end
