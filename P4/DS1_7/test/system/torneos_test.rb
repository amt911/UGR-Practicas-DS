require "application_system_test_case"

class TorneosTest < ApplicationSystemTestCase
  setup do
    @torneo = torneos(:one)
  end

  test "visiting the index" do
    visit torneos_url
    assert_selector "h1", text: "Torneos"
  end

  test "should create torneo" do
    visit torneos_url
    click_on "New torneo"

    fill_in "Descripcion", with: @torneo.descripcion
    check "Es bomba" if @torneo.es_bomba
    fill_in "Fecha max juego", with: @torneo.fecha_max_juego
    fill_in "Multiplier", with: @torneo.multiplier
    fill_in "Nombre", with: @torneo.nombre
    fill_in "Piezas puestas", with: @torneo.piezas_puestas
    fill_in "Probabilidad", with: @torneo.probabilidad
    click_on "Create Torneo"

    assert_text "Torneo was successfully created"
    click_on "Back"
  end

  test "should update Torneo" do
    visit torneo_url(@torneo)
    click_on "Edit this torneo", match: :first

    fill_in "Descripcion", with: @torneo.descripcion
    check "Es bomba" if @torneo.es_bomba
    fill_in "Fecha max juego", with: @torneo.fecha_max_juego
    fill_in "Multiplier", with: @torneo.multiplier
    fill_in "Nombre", with: @torneo.nombre
    fill_in "Piezas puestas", with: @torneo.piezas_puestas
    fill_in "Probabilidad", with: @torneo.probabilidad
    click_on "Update Torneo"

    assert_text "Torneo was successfully updated"
    click_on "Back"
  end

  test "should destroy Torneo" do
    visit torneo_url(@torneo)
    click_on "Destroy this torneo", match: :first

    assert_text "Torneo was successfully destroyed"
  end
end
