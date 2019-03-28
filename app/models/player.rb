class Player < ApplicationRecord
  has_many :participants
  validates_presence_of :email
  validates_presence_of :first_name
  validates_presence_of :last_name

  # TODO: replace when device is in place.
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :rango, inclusion: { in: PlayersHelper::VALID_RANKS, message: "is not valid." }

  def full_name
    first_name + ' ' + last_name
  end
end
