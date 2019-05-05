class RemoveWinnerFromMatch < ActiveRecord::Migration[5.2]
  def change
    remove_column :matches, :winner
  end
end
