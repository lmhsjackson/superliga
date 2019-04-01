class ChangeRangoToRankInPlayer < ActiveRecord::Migration[5.2]
  def change
    rename_column :players, :rango, :rank
  end
end
