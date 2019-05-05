class Participant < ApplicationRecord
  belongs_to :player
  belongs_to :league
  has_many :match_participations
  has_many :matches, through: :match_participations
  delegate :first_name, :last_name, :full_name, to: :player
  validates_presence_of :score

  def update_score
    new_score = 0
    match_participations.each do |game|
      new_score += game.winner ? 3 : 1
    end
    update score: new_score
  end
end
