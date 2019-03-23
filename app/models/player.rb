class Player < ApplicationRecord
  has_many :participants
  validates_presence_of :email
  # TODO: replace when device is in place.
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :rango, inclusion: { in: PlayersHelper::VALID_RANKS, message: "is not valid." }
end
