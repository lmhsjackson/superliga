class MatchParticipation < ApplicationRecord
  belongs_to :participant
  belongs_to :match, inverse_of: :match_participations

  enum color: %w{black white}

  validates_presence_of :color
end
