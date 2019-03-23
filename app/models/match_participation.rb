class MatchParticipation < ApplicationRecord
  belongs_to :participant
  belongs_to :match
end
