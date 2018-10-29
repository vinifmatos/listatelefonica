require "application_system_test_case"

class LocaisTest < ApplicationSystemTestCase
  setup do
    @local = locais(:one)
  end

  test "visiting the index" do
    visit locais_url
    assert_selector "h1", text: "Locais"
  end

  test "creating a Local" do
    visit locais_url
    click_on "New Local"

    fill_in "Nome", with: @local.nome
    fill_in "Telefone", with: @local.telefone
    click_on "Create Local"

    assert_text "Local was successfully created"
    click_on "Back"
  end

  test "updating a Local" do
    visit locais_url
    click_on "Edit", match: :first

    fill_in "Nome", with: @local.nome
    fill_in "Telefone", with: @local.telefone
    click_on "Update Local"

    assert_text "Local was successfully updated"
    click_on "Back"
  end

  test "destroying a Local" do
    visit locais_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Local was successfully destroyed"
  end
end
