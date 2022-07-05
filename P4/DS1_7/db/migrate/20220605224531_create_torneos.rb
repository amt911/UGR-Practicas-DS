class CreateTorneos < ActiveRecord::Migration[7.0]
  def change
    create_table :torneos do |t|
      t.string :nombre
      t.date :fecha_max_juego
      t.boolean :es_bomba
      t.float :multiplier
      t.integer :piezas_puestas
      t.string :descripcion
      t.float :probabilidad

      t.timestamps
    end
  end
end
