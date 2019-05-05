class AddWinnerToMatchParticipation < ActiveRecord::Migration[5.2]
  def change
     add_column :match_participations, :winner, :boolean
  end
end
