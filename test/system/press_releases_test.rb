require "application_system_test_case"

class PressReleasesTest < ApplicationSystemTestCase
  setup do
    @press_release = press_releases(:one)
  end

  test "visiting the index" do
    visit press_releases_url
    assert_selector "h1", text: "Press Releases"
  end

  test "creating a Press release" do
    visit press_releases_url
    click_on "New Press Release"

    fill_in "Article", with: @press_release.article
    fill_in "Title", with: @press_release.title
    click_on "Create Press release"

    assert_text "Press release was successfully created"
    click_on "Back"
  end

  test "updating a Press release" do
    visit press_releases_url
    click_on "Edit", match: :first

    fill_in "Article", with: @press_release.article
    fill_in "Title", with: @press_release.title
    click_on "Update Press release"

    assert_text "Press release was successfully updated"
    click_on "Back"
  end

  test "destroying a Press release" do
    visit press_releases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Press release was successfully destroyed"
  end
end
