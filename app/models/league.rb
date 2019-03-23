class League < ApplicationRecord
  belongs_to :director, class_name: 'Player'
  has_many :matches, dependent: :destroy
  has_many :participants, dependent: :destroy
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def register_participant(player, rank = nil)
    Participant.new_from(player, rank)
  end
end
