class CreateParticipas < ActiveRecord::Migration[7.0]
  def change
    create_table :participas do |t|
      t.belongs_to :torneo, null: false, foreign_key: true
      t.belongs_to :usuario, null: false, foreign_key: true
      t.integer :puntuacion

      t.timestamps
    end
  end
end
