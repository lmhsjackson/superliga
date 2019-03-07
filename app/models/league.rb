class League < ApplicationRecord
  belongs_to :director, class_name: 'Player'
end
