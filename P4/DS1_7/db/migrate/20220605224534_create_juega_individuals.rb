class CreateJuegaIndividuals < ActiveRecord::Migration[7.0]
  def change
    create_table :juega_individuals do |t|
      t.belongs_to :usuario, null: false, foreign_key: true
      t.integer :puntuacion
      t.date :fecha

      t.timestamps
    end
  end
end
