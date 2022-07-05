require "application_system_test_case"

class JuegaIndividualsTest < ApplicationSystemTestCase
  setup do
    @juega_individual = juega_individuals(:one)
  end

  test "visiting the index" do
    visit juega_individuals_url
    assert_selector "h1", text: "Juega individuals"
  end

  test "should create juega individual" do
    visit juega_individuals_url
    click_on "New juega individual"

    fill_in "Fecha", with: @juega_individual.fecha
    fill_in "Puntuacion", with: @juega_individual.puntuacion
    fill_in "Usuario", with: @juega_individual.usuario_id
    click_on "Create Juega individual"

    assert_text "Juega individual was successfully created"
    click_on "Back"
  end

  test "should update Juega individual" do
    visit juega_individual_url(@juega_individual)
    click_on "Edit this juega individual", match: :first

    fill_in "Fecha", with: @juega_individual.fecha
    fill_in "Puntuacion", with: @juega_individual.puntuacion
    fill_in "Usuario", with: @juega_individual.usuario_id
    click_on "Update Juega individual"

    assert_text "Juega individual was successfully updated"
    click_on "Back"
  end

  test "should destroy Juega individual" do
    visit juega_individual_url(@juega_individual)
    click_on "Destroy this juega individual", match: :first

    assert_text "Juega individual was successfully destroyed"
  end
end
