class Match < ApplicationRecord
  belongs_to :location
  belongs_to :league
  has_many :match_participations, inverse_of: :match, dependent: :destroy
  has_many :participants, through: :match_participations

  accepts_nested_attributes_for :match_participations

  VICTORY_CONDITIONS = ['resignation', 'time', 'points'].freeze
  WINNER = ['black', 'white'].freeze

  validate :two_different_oponents
  validates :victory_condition, inclusion: { in: VICTORY_CONDITIONS, message: "is not valid." }

  def black_participant
    match_participations.find_by(color: 'black').participant
  end

  def white_participant
    match_participations.find_by(color: 'white').participant
  end
  private

  def two_different_oponents
    return if match_participations.map(&:participant_id).uniq.count == 2
    return if match_participations.count == 2
    errors.add(:participants, 'need two different participants')
  end
end
