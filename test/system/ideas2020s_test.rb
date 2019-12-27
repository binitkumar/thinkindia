require "application_system_test_case"

class Ideas2020sTest < ApplicationSystemTestCase
  setup do
    @ideas2020 = ideas2020s(:one)
  end

  test "visiting the index" do
    visit ideas2020s_url
    assert_selector "h1", text: "Ideas2020s"
  end

  test "creating a Ideas2020" do
    visit ideas2020s_url
    click_on "New Ideas2020"

    fill_in "Email", with: @ideas2020.email
    fill_in "Name", with: @ideas2020.name
    fill_in "Title", with: @ideas2020.title
    click_on "Create Ideas2020"

    assert_text "Ideas2020 was successfully created"
    click_on "Back"
  end

  test "updating a Ideas2020" do
    visit ideas2020s_url
    click_on "Edit", match: :first

    fill_in "Email", with: @ideas2020.email
    fill_in "Name", with: @ideas2020.name
    fill_in "Title", with: @ideas2020.title
    click_on "Update Ideas2020"

    assert_text "Ideas2020 was successfully updated"
    click_on "Back"
  end

  test "destroying a Ideas2020" do
    visit ideas2020s_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Ideas2020 was successfully destroyed"
  end
end
