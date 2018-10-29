require "application_system_test_case"

class ContatosTest < ApplicationSystemTestCase
  setup do
    @contato = contatos(:one)
  end

  test "visiting the index" do
    visit contatos_url
    assert_selector "h1", text: "Contatos"
  end

  test "creating a Contato" do
    visit contatos_url
    click_on "New Contato"

    fill_in "Ativo", with: @contato.ativo
    fill_in "Cargo", with: @contato.cargo
    fill_in "Celular{11}", with: @contato.celular{11}
    fill_in "Departamento", with: @contato.departamento_id
    fill_in "Nome", with: @contato.nome
    fill_in "Telefone{10}", with: @contato.telefone{10}
    click_on "Create Contato"

    assert_text "Contato was successfully created"
    click_on "Back"
  end

  test "updating a Contato" do
    visit contatos_url
    click_on "Edit", match: :first

    fill_in "Ativo", with: @contato.ativo
    fill_in "Cargo", with: @contato.cargo
    fill_in "Celular{11}", with: @contato.celular{11}
    fill_in "Departamento", with: @contato.departamento_id
    fill_in "Nome", with: @contato.nome
    fill_in "Telefone{10}", with: @contato.telefone{10}
    click_on "Update Contato"

    assert_text "Contato was successfully updated"
    click_on "Back"
  end

  test "destroying a Contato" do
    visit contatos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contato was successfully destroyed"
  end
end
