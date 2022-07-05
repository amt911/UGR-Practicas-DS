require "test_helper"

class ParticipasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participa = participas(:one)
  end

  test "should get index" do
    get participas_url
    assert_response :success
  end

  test "should get new" do
    get new_participa_url
    assert_response :success
  end

  test "should create participa" do
    assert_difference("Participa.count") do
      post participas_url, params: { participa: { puntuacion: @participa.puntuacion, torneo_id: @participa.torneo_id, usuario_id: @participa.usuario_id } }
    end

    assert_redirected_to participa_url(Participa.last)
  end

  test "should show participa" do
    get participa_url(@participa)
    assert_response :success
  end

  test "should get edit" do
    get edit_participa_url(@participa)
    assert_response :success
  end

  test "should update participa" do
    patch participa_url(@participa), params: { participa: { puntuacion: @participa.puntuacion, torneo_id: @participa.torneo_id, usuario_id: @participa.usuario_id } }
    assert_redirected_to participa_url(@participa)
  end

  test "should destroy participa" do
    assert_difference("Participa.count", -1) do
      delete participa_url(@participa)
    end

    assert_redirected_to participas_url
  end
end
