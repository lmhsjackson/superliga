class MatchParticipation < ApplicationRecord
  belongs_to :participant
  belongs_to :match, inverse_of: :match_participations

  after_commit :update_participant_score

  enum color: %w{black white}

  validates_presence_of :color

  def self.white_participant
    find_by(color: 'white').participant
  end

  def self.black_participant
    find_by(color: 'black').participant
  end

  def self.winner
    find_by(winner: true).participant
  end

  def update_participant_score
    participant.update_score
  end
end
