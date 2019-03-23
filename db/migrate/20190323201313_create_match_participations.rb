class CreateMatchParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :match_participations do |t|
      t.references :participant, foreign_key: true
      t.references :match, foreign_key: true

      t.timestamps
    end
  end
end
