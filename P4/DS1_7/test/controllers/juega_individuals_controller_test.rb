require "test_helper"

class JuegaIndividualsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @juega_individual = juega_individuals(:one)
  end

  test "should get index" do
    get juega_individuals_url
    assert_response :success
  end

  test "should get new" do
    get new_juega_individual_url
    assert_response :success
  end

  test "should create juega_individual" do
    assert_difference("JuegaIndividual.count") do
      post juega_individuals_url, params: { juega_individual: { fecha: @juega_individual.fecha, puntuacion: @juega_individual.puntuacion, usuario_id: @juega_individual.usuario_id } }
    end

    assert_redirected_to juega_individual_url(JuegaIndividual.last)
  end

  test "should show juega_individual" do
    get juega_individual_url(@juega_individual)
    assert_response :success
  end

  test "should get edit" do
    get edit_juega_individual_url(@juega_individual)
    assert_response :success
  end

  test "should update juega_individual" do
    patch juega_individual_url(@juega_individual), params: { juega_individual: { fecha: @juega_individual.fecha, puntuacion: @juega_individual.puntuacion, usuario_id: @juega_individual.usuario_id } }
    assert_redirected_to juega_individual_url(@juega_individual)
  end

  test "should destroy juega_individual" do
    assert_difference("JuegaIndividual.count", -1) do
      delete juega_individual_url(@juega_individual)
    end

    assert_redirected_to juega_individuals_url
  end
end
