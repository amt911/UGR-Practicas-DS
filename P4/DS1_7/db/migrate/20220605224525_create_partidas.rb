class CreatePartidas < ActiveRecord::Migration[7.0]
  def change
    create_table :partidas do |t|
      t.integer :puntuacion
      t.date :fecha

      t.timestamps
    end
  end
end
