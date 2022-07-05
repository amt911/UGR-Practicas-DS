require "test_helper"

class AddUsuarioTest < ActionDispatch::IntegrationTest
  test "create usuario" do
    get "/usuarios/new"
    assert_response :success
    post "/usuarios", params: {usuario: {nombre: "tiopaco2024", contrasena: "tiopaco",admin:0}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Usuario was successfully created."
  end
end
