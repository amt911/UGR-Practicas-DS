require "application_system_test_case"

class PartidasTest < ApplicationSystemTestCase
  setup do
    @partida = partidas(:one)
  end

  test "visiting the index" do
    visit partidas_url
    assert_selector "h1", text: "Partidas"
  end

  test "should create partida" do
    visit partidas_url
    click_on "New partida"

    fill_in "Fecha", with: @partida.fecha
    fill_in "Puntuacion", with: @partida.puntuacion
    click_on "Create Partida"

    assert_text "Partida was successfully created"
    click_on "Back"
  end

  test "should update Partida" do
    visit partida_url(@partida)
    click_on "Edit this partida", match: :first

    fill_in "Fecha", with: @partida.fecha
    fill_in "Puntuacion", with: @partida.puntuacion
    click_on "Update Partida"

    assert_text "Partida was successfully updated"
    click_on "Back"
  end

  test "should destroy Partida" do
    visit partida_url(@partida)
    click_on "Destroy this partida", match: :first

    assert_text "Partida was successfully destroyed"
  end
end
