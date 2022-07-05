require "test_helper"

class TorneosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @torneo = torneos(:one)
  end

  test "should get index" do
    get torneos_url
    assert_response :success
  end

  test "should get new" do
    get new_torneo_url
    assert_response :success
  end

  test "should create torneo" do
    assert_difference("Torneo.count") do
      post torneos_url, params: { torneo: { descripcion: @torneo.descripcion, es_bomba: @torneo.es_bomba, fecha_max_juego: @torneo.fecha_max_juego, multiplier: @torneo.multiplier, nombre: @torneo.nombre, piezas_puestas: @torneo.piezas_puestas, probabilidad: @torneo.probabilidad } }
    end

    assert_redirected_to torneo_url(Torneo.last)
  end

  test "should show torneo" do
    get torneo_url(@torneo)
    assert_response :success
  end

  test "should get edit" do
    get edit_torneo_url(@torneo)
    assert_response :success
  end

  test "should update torneo" do
    patch torneo_url(@torneo), params: { torneo: { descripcion: @torneo.descripcion, es_bomba: @torneo.es_bomba, fecha_max_juego: @torneo.fecha_max_juego, multiplier: @torneo.multiplier, nombre: @torneo.nombre, piezas_puestas: @torneo.piezas_puestas, probabilidad: @torneo.probabilidad } }
    assert_redirected_to torneo_url(@torneo)
  end

  test "should destroy torneo" do
    assert_difference("Torneo.count", -1) do
      delete torneo_url(@torneo)
    end

    assert_redirected_to torneos_url
  end
end
