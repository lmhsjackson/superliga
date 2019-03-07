class Match < ApplicationRecord
  belongs_to :location
  belongs_to :league
  belongs_to :black_player, class_name: 'Player'
  belongs_to :white_player, class_name: 'Player'
  validate :not_playing_oneself

  def not_playing_oneself
    errors.add(:white_player_id, 'Is the same as black player') unless black_player != white_player
  end
end
