class Participant < ApplicationRecord
  belongs_to :player
  belongs_to :league
  has_many :match_participations
  has_many :matches, through: :match_participations

  def self.new_from(player, rank=nil)
    create(first_name: player.first_name,
           last_name: player.last_name,
           rank: (rank || player.rango),
           score: 0)
  end
end
