class Match < ApplicationRecord
  belongs_to :location
  belongs_to :league
  has_many :match_participations
  has_many :participants, through: :match_participations

  VICTORY_CONDITIONS = ['resignation', 'time', 'points'].freeze
  WINNER = ['black', 'white'].freeze

  validate :not_playing_oneself
  validates :victory_condition, inclusion: { in: VICTORY_CONDITIONS, message: "is not valid." }

  def self.by_player(player)
    # where(black_player_id: player.id).or(where(white_player_id: player.id))
  end


  private

  def not_playing_oneself
    # errors.add(:white_player_id, 'Is the same as black player') unless black_player != white_player
  end
end
