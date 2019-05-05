class League < ApplicationRecord
  belongs_to :director, class_name: 'Player'
  has_many :matches, dependent: :destroy
  has_many :participants, dependent: :destroy
  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  delegate :full_name, to: :director, prefix: true

  def active?
    (start_date..end_date).include? Date.today
  end
end
