class AddPlayersIdsToMatch < ActiveRecord::Migration[5.2]
  def change
     add_column :matches, :black_player_id, :integer
     add_column :matches, :white_player_id, :integer
  end
end
