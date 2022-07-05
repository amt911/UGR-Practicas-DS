json.extract! usuario, :id, :nombre, :contrasena, :admin, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
