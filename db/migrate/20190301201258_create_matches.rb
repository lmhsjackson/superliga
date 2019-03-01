class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :kifu
      t.integer :handicap
      t.string :winner
      t.string :victory_condition
      t.references :location, foreign_key: true
      t.references :league, foreign_key: true

      t.timestamps
    end
  end
end
