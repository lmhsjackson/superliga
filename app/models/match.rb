class Match < ApplicationRecord
  belongs_to :location
  belongs_to :league
  has_many :match_participations, inverse_of: :match, dependent: :destroy

  has_many :participants, through: :match_participations

  accepts_nested_attributes_for :match_participations

  VICTORY_CONDITIONS = ['resignation', 'time', 'points'].freeze
  WINNER = ['black', 'white'].freeze

  validates :victory_condition, inclusion: { in: VICTORY_CONDITIONS, message: 'is not valid.' }
  delegate :white_participant, :black_participant, :winner, to: :match_participations
end
