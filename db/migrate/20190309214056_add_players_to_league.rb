class AddPlayersToLeague < ActiveRecord::Migration[5.2]
  def change
    add_column :leagues, :director_id, :integer, foreign_key: true
  end
end
