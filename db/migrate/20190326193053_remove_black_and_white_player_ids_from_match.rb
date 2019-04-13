class RemoveBlackAndWhitePlayerIdsFromMatch < ActiveRecord::Migration[5.2]
  def change
    remove_column :matches, :white_player_id
    remove_column :matches, :black_player_id

  end
end
