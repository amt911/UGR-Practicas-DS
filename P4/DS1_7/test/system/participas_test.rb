require "application_system_test_case"

class ParticipasTest < ApplicationSystemTestCase
  setup do
    @participa = participas(:one)
  end

  test "visiting the index" do
    visit participas_url
    assert_selector "h1", text: "Participas"
  end

  test "should create participa" do
    visit participas_url
    click_on "New participa"

    fill_in "Puntuacion", with: @participa.puntuacion
    fill_in "Torneo", with: @participa.torneo_id
    fill_in "Usuario", with: @participa.usuario_id
    click_on "Create Participa"

    assert_text "Participa was successfully created"
    click_on "Back"
  end

  test "should update Participa" do
    visit participa_url(@participa)
    click_on "Edit this participa", match: :first

    fill_in "Puntuacion", with: @participa.puntuacion
    fill_in "Torneo", with: @participa.torneo_id
    fill_in "Usuario", with: @participa.usuario_id
    click_on "Update Participa"

    assert_text "Participa was successfully updated"
    click_on "Back"
  end

  test "should destroy Participa" do
    visit participa_url(@participa)
    click_on "Destroy this participa", match: :first

    assert_text "Participa was successfully destroyed"
  end
end
