class Player < ApplicationRecord
  validates_presence_of :email
  # TODO: replace when device is in place.
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

end
