class AddColorToMatchParticipations < ActiveRecord::Migration[5.2]
  def change
    add_column :match_participations, :color, :integer
  end
end
