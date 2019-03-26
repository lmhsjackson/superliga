class Participant < ApplicationRecord
  belongs_to :player
  belongs_to :league
  has_many :match_participations
  has_many :matches, through: :match_participations
  delegate :first_name, :last_name, to: :player
  validates_presence_of :score
end
