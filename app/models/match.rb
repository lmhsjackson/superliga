class Match < ApplicationRecord
  belongs_to :location
  belongs_to :league
  has_many :match_participations
  has_many :participants, through: :match_participations

  VICTORY_CONDITIONS = ['resignation', 'time', 'points'].freeze
  WINNER = ['black', 'white'].freeze

  validate :two_different_oponents
  validates :victory_condition, inclusion: { in: VICTORY_CONDITIONS, message: "is not valid." }



  private

  def two_different_oponents
    participants.uniq.count == 2
  end
end
