class League < ApplicationRecord
  belongs_to :director, class_name: 'Player'
  has_many :matches
  has_many :white_players, through: :matches
  has_many :black_players, through: :matches
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def players
    (black_players + white_players).uniq
  end
end
