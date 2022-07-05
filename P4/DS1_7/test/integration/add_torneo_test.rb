require "test_helper"

class AddTorneoTest < ActionDispatch::IntegrationTest
  test "create torneo" do
    get "/torneos/new"
    assert_response :success
    post "/torneos", params: {torneo: {id:125,nombre: "Torneo de prueba", descripcion: "Torneo de prueba",es_bomba:0,multiplier:1.0,piezas_puestas:3,probabilidad:0.5,created_at:Time.now,updated_at:Time.now,fecha_max_juego:Time.now}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Torneo was successfully created."
  end
end
