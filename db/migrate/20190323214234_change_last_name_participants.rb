class ChangeLastNameParticipants < ActiveRecord::Migration[5.2]
  def change
    change_column :participants, :last_name, :string
  end
end
