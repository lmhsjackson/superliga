class DefaultParticipantScoreToZero < ActiveRecord::Migration[5.2]
  def change
    change_column :participants, :score, :integer, default: 0
  end
end
