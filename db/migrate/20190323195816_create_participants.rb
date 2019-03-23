class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.string :rank
      t.string :first_name
      t.integer :last_name
      t.integer :score
      t.references :player, foreign_key: true
      t.references :league, foreign_key: true

      t.timestamps
    end
  end
end
