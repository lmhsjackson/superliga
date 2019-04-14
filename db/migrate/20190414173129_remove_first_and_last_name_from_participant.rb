class RemoveFirstAndLastNameFromParticipant < ActiveRecord::Migration[5.2]
  def change
    remove_column :participants, :first_name
    remove_column :participants, :last_name
  end
end
