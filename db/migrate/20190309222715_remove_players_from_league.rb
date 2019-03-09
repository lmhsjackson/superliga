class RemovePlayersFromLeague < ActiveRecord::Migration[5.2]
  def change
    remove_reference :leagues, :player, foreing_key: true
  end
end
