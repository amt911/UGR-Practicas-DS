json.extract! torneo, :id, :nombre, :fecha_max_juego, :es_bomba, :multiplier, :piezas_puestas, :descripcion, :probabilidad, :created_at, :updated_at
json.url torneo_url(torneo, format: :json)
