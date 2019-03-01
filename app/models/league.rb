class League < ApplicationRecord
  belongs_to :player
  alias_attribute :director, :player
end
