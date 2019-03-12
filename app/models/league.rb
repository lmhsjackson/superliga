class League < ApplicationRecord
  belongs_to :director, class_name: 'Player'
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
