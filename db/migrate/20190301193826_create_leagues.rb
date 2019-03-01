class CreateLeagues < ActiveRecord::Migration[5.2]
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :edition
      t.date :start_date
      t.date :end_date
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
